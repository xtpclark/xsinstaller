CREATE OR REPLACE FUNCTION public.compareversion(text, text DEFAULT split_part(version(), ' '::text, 2))
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple. 
-- See www.xtuple.com/CPAL for the full text of the software license.
-- Returns 1 if the left version is greater than the right version
-- -1 if the right is greater than the left
--  0 if the versions are equal.
-- parameter two defaults to current server version
  RETURNS integer AS
$BODY$
DECLARE
  _leftVersion ALIAS FOR $1;
  _rightVersion ALIAS FOR $2;
  _leftMajor SMALLINT;
  _leftMinor SMALLINT;
  _leftPatch SMALLINT;
  _rightMajor SMALLINT;
  _rightMinor SMALLINT;
  _rightPatch SMALLINT;
  _returnCode SMALLINT;
  DEBUG BOOLEAN := false;
BEGIN

-- left
SELECT  substring(_leftVersion FROM $$(\d+)\.\d+\.\d+$$)::SMALLINT, 
	substring(_leftVersion FROM $$\d+\.(\d+)\.\d+$$)::SMALLINT, 
	substring(_leftVersion FROM $$\d+\.\d+\.(\d+)$$)::SMALLINT 
	INTO _leftMajor, _leftMinor, _leftPatch;

IF (DEBUG)
  THEN RAISE NOTICE 'Left Version --> % Major --> % Minor --> % Patch --> % ', _leftVersion, _leftMajor, _leftMinor, _leftPatch;
END IF;

-- right
SELECT  substring(_rightVersion FROM $$(\d+)\.\d+\.\d+$$)::SMALLINT, 
	substring(_rightVersion FROM $$\d+\.(\d+)\.\d+$$)::SMALLINT, 
	substring(_rightVersion FROM $$\d+\.\d+\.(\d+)$$)::SMALLINT 
	INTO _rightMajor, _rightMinor, _rightPatch;

IF (DEBUG)
 THEN RAISE NOTICE 'Right Version --> % Major --> % Minor --> % Patch --> % ', _rightVersion, _rightMajor, _rightMinor, _rightPatch;
END IF;

-- check major version
IF (_leftMajor > _rightMajor) THEN _returnCode := 1;
ELSIF (_leftMajor < _rightMajor) THEN _returnCode := -1;
ELSIF (_leftMajor = _rightMajor) THEN
  -- if major is equal, check minor version
  IF (_leftMinor > _rightMinor) THEN _returnCode := 1;
  ELSIF (_leftMinor < _rightMinor) THEN _returnCode := -1;
  ELSIF (_leftMinor = _rightMinor) THEN
    -- if major and minor are equal, check patch version
    IF (_leftPatch > _rightPatch) THEN _returnCode := 1;
    ELSIF (_leftPatch < _rightPatch) THEN _returnCode := -1;
    ELSIF (_leftPatch = _rightPatch) THEN _returnCode := 0;
    END IF;
  END IF;
-- if we somehow don't match those three operators it probably means someone passed in a version that wasn't in numerical major.minor.patch format
ELSE RAISE EXCEPTION 'One or more of the version parameters is invalid. Expected numerical Major.Minor.Patch version string. Left --> % Right --> %', _leftVersion, _rightVersion;
END IF;

RETURN _returnCode;

END;
$BODY$
  LANGUAGE plpgsql STABLE;
ALTER FUNCTION public.compareversion(text, text)
  OWNER TO admin;

CREATE OR REPLACE FUNCTION getEffectiveXtUser() RETURNS TEXT AS $$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple. 
-- See www.xtuple.com/CPAL for the full text of the software license.
BEGIN
/*
  The default return value of this function is simply
  the user currently connected.
  
  Overload this function from another schema 
  to implement specific user handling from an external 
  application that uses connection pooling. 
  Use setEffectiveXtUser(text) to create a temporary table that 
  inserts user data that can in turn be used as a lookup 
  reference for an over loaded version of this function like so:
  
  SELECT effective_value
  FROM effective_user
  WHERE effective_key = 'username'
*/

  RETURN CURRENT_USER;

END;
$$ LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION public.login() RETURNS integer AS $$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple. 
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE 
  _p RECORD;

BEGIN

  RETURN login(false);

END;
$$ LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION login(boolean)
  RETURNS integer AS
$BODY$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple. 
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE 
  _setSearchPath ALIAS FOR $1;
  _p RECORD;

BEGIN
  -- added support for PostgreSQL 9.2.0, Incident 21852
  IF (compareversion('9.2.0') <= 0)
  THEN
    PERFORM pg_try_advisory_lock(datid::integer, pid)
     FROM pg_stat_activity
    WHERE(pid = pg_backend_pid());
  ELSE
    PERFORM pg_try_advisory_lock(datid::integer, procpid)
     FROM pg_stat_activity
    WHERE(procpid = pg_backend_pid());
  END IF;

  -- This is new to version 9.0 and higher and will error on older versions
  IF (compareversion('9.0.0') <= 0) THEN
    SET bytea_output TO escape;
  END IF;

  -- this is temporary until either qt fixes the postgres driver or we find &
  -- fix all of the places in our app that can write strings with backslashes
  SET standard_conforming_strings TO false;

  SELECT usr_id, userCanLogin(usr_username) AS usr_active INTO _p
  FROM usr
  WHERE (usr_username=getEffectiveXtUser());

  IF (NOT FOUND) THEN
    RETURN -1;

  ELSIF (NOT _p.usr_active) THEN
    IF(SELECT metric_value='AdminOnly'
         FROM metric
        WHERE metric_name='AllowedUserLogins') THEN
      RETURN -3;
    END IF;
    RETURN -2;
  END IF;

  IF (_setSearchPath) THEN
    IF EXISTS(SELECT 1
                FROM pg_proc
                JOIN pg_namespace ON (pronamespace=pg_namespace.oid)
               WHERE nspname='public'
                 AND proname='buildsearchpath') THEN
      EXECUTE 'SET SEARCH_PATH TO ' || public.buildSearchPath();
    END IF;
  END IF;

  RETURN 1;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION login(boolean)
  OWNER TO admin;

CREATE OR REPLACE FUNCTION formatSoNumber(INTEGER) RETURNS TEXT AS $$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple.
-- See www.xtuple.com/CPAL for the full text of the software license.
SELECT COALESCE((SELECT (text(cohead_number) || '-' || formatSoLineNumber(coitem_id))
                   FROM coitem JOIN cohead ON (coitem_cohead_id=cohead_id)
                  WHERE (coitem_id=($1))),'DELETED');
$$ LANGUAGE 'sql' STABLE;
