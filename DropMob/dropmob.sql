DROP VIEW IF EXISTS  xm.shipment                            ;
DROP VIEW IF EXISTS  xm.ship_shipment                       ;
DROP VIEW IF EXISTS  xm.purchase_order                      ;
DROP VIEW IF EXISTS  xm.receipt                             ;
DROP VIEW IF EXISTS  xm.sales_order                         ;
DROP VIEW IF EXISTS  xm.shipment_line                       ;
DROP VIEW IF EXISTS  xm.ship_shipment_line                  ;
DROP VIEW IF EXISTS  xm.purchase_order_line                 ;
DROP VIEW IF EXISTS  xm.sales_order_line                    ;
DROP VIEW IF EXISTS  xm.account                             ;
DROP VIEW IF EXISTS  xm.contact                             ;
DROP VIEW IF EXISTS  xm.customer                            ;
DROP VIEW IF EXISTS  xm.incident                            ;
DROP VIEW IF EXISTS  xm.inventory_history                   ;
DROP VIEW IF EXISTS  xm.issue_to_shipping                   ;
DROP VIEW IF EXISTS  xm.item                                ;
DROP VIEW IF EXISTS  xm.location                            ;
DROP VIEW IF EXISTS  xm.opportunity                         ;
DROP VIEW IF EXISTS  xm.project                             ;
DROP VIEW IF EXISTS  xm.purchase_order_list_item            ;
DROP VIEW IF EXISTS  xm.purchase_order_relation             ;
DROP VIEW IF EXISTS  xm.quote                               ;
DROP VIEW IF EXISTS  xm.sales_history                       ;
DROP VIEW IF EXISTS  xm.sales_order_line_list_item          ;
DROP VIEW IF EXISTS  xm.to_do                               ;
DROP VIEW IF EXISTS  xm.work_order_list_item                ;
DROP VIEW IF EXISTS  xm.account_item                        ;
DROP VIEW IF EXISTS  xm.contact_item                        ;
DROP VIEW IF EXISTS  xm.customer_item                       ;
DROP VIEW IF EXISTS  xm.incident_item                       ;
DROP VIEW IF EXISTS  xm.item_item                           ;
DROP VIEW IF EXISTS  xm.item_site                           ;
DROP VIEW IF EXISTS  xm.item_site_inventory                 ;
DROP VIEW IF EXISTS  xm.item_site_list_item                 ;
DROP VIEW IF EXISTS  xm.item_site_relation                  ;
DROP VIEW IF EXISTS  xm.location_item                       ;
DROP VIEW IF EXISTS  xm.opportunity_item                    ;
DROP VIEW IF EXISTS  xm.project_item                        ;
DROP VIEW IF EXISTS  xm.quote_item                          ;
DROP VIEW IF EXISTS  xm.quote_line                          ;
DROP VIEW IF EXISTS  xm.sales_order_item                    ;
DROP VIEW IF EXISTS  xm.to_do_item                          ;
DROP VIEW IF EXISTS  xm.vendor                              ;
DROP VIEW IF EXISTS  xm.vendor_relation                     ;
DROP VIEW IF EXISTS  xm.account_list_item                   ;
DROP VIEW IF EXISTS  xm.address                             ;
DROP VIEW IF EXISTS  xm.contact_list_item                   ;
DROP VIEW IF EXISTS  xm.employee                            ;
DROP VIEW IF EXISTS  xm.incident_list_item                  ;
DROP VIEW IF EXISTS  xm.item_list_item                      ;
DROP VIEW IF EXISTS  xm.item_relation                       ;
DROP VIEW IF EXISTS  xm.opportunity_list_item               ;
DROP VIEW IF EXISTS  xm.account_characteristic              ;
DROP VIEW IF EXISTS  xm.account_list_item_characteristic    ;
DROP VIEW IF EXISTS  xm.address_characteristic              ;
DROP VIEW IF EXISTS  xm.contact_characteristic              ;
DROP VIEW IF EXISTS  xm.contact_list_item_characteristic    ;
DROP VIEW IF EXISTS  xm.customer_characteristic             ;
DROP VIEW IF EXISTS  xm.employee_characteristic             ;
DROP VIEW IF EXISTS  xm.incident_characteristic             ;
DROP VIEW IF EXISTS  xm.incident_list_item_characteristic   ;
DROP VIEW IF EXISTS  xm.item_characteristic                 ;
DROP VIEW IF EXISTS  xm.item_list_item_characteristic       ;
DROP VIEW IF EXISTS  xm.item_relation_characteristic        ;
DROP VIEW IF EXISTS  xm.opportunity_characteristic          ;
DROP VIEW IF EXISTS  xm.opportunity_list_item_characteristic;
DROP VIEW IF EXISTS  xm.quote_line_characteristic           ;
DROP VIEW IF EXISTS  xm.sales_order_line_characteristic     ;
ALTER TABLE charass NO INHERIT xt.obj;
ALTER TABLE charass DROP column obj_uuid;



-- cleanup alarm
DROP VIEW IF EXISTS  xm.project_task       ;
DROP VIEW IF EXISTS  xm.incident_alarm     ;
DROP VIEW IF EXISTS  xm.project_task_alarm ;
DROP VIEW IF EXISTS  xm.to_do_alarm        ;
ALTER TABLE alarm NO INHERIT xt.obj;
ALTER TABLE alarm DROP column obj_uuid;



--cleanup ccard
DROP VIEW IF EXISTS  sys.sales_order_payment ;
DROP VIEW IF EXISTS  sys.credit_card_payment ;
DROP VIEW IF EXISTS  xm.sales_customer       ;
DROP VIEW IF EXISTS  sys.credit_card         ;
DROP VIEW IF EXISTS  xm.credit_card          ;
ALTER TABLE ccard NO INHERIT xt.obj;
ALTER TABLE ccard DROP column obj_uuid;


--cleanup charopt
DROP VIEW IF EXISTS  xm.characteristic       ;
DROP VIEW IF EXISTS  xm.characteristic_option;
ALTER TABLE charopt NO INHERIT xt.obj;
ALTER TABLE charopt DROP column obj_uuid;

--cleanup charopt
DROP VIEW IF EXISTS  xm.characteristic       ;
DROP VIEW IF EXISTS  xm.characteristic_option;
ALTER TABLE charopt NO INHERIT xt.obj;
ALTER TABLE charopt DROP column obj_uuid;

ALTER TABLE itemsrc NO INHERIT xt.obj;
ALTER TABLE itemsrc DROP column obj_uuid;

ALTER TABLE itemsrcp NO INHERIT xt.obj;
alter table itemsrcp drop column  obj_uuid ;

alter table invcheadtax NO INHERIT xt.obj;
alter table invcheadtax drop column  obj_uuid ;

alter table aropentax NO INHERIT xt.obj;
alter table aropentax drop column  obj_uuid ;

alter table aropenalloc NO INHERIT xt.obj;
alter table aropenalloc drop column  obj_uuid ;

alter table itemgrp NO INHERIT xt.obj;
alter table itemgrp drop column  obj_uuid ;

drop table xt.prjwf;
drop table if exists xt.wf;

alter table cntct drop column  obj_uuid ;
alter table vendinfo drop column  obj_uuid ;
alter table aropen drop column  obj_uuid ;
alter table custinfo drop column  obj_uuid ;
alter table cmhead drop column  obj_uuid ;
drop view if exists creditmemoitem;
alter table cmitem drop column  obj_uuid ;
alter table invchead drop column  obj_uuid ;
alter table prj drop column  obj_uuid ;
drop view if exists invoiceitem;
alter table invcitem drop column  obj_uuid ;
alter table ophead drop column  obj_uuid ;
drop view if exists address;
alter table addr drop column  obj_uuid ;
alter table cashrcptitem drop column  obj_uuid ;
alter table emp drop column  obj_uuid ;
alter table shiphead drop column  obj_uuid ;
alter table womatl drop column  obj_uuid ;
alter table vendaddrinfo drop column  obj_uuid ;
drop view if exists saleshistory;
drop view if exists saleshistorymisc;
alter table cohist drop column  obj_uuid ;
alter table arapply drop column  obj_uuid ;
alter table ccpay drop column  obj_uuid ;
alter table cmheadtax drop column  obj_uuid ;
alter table cmitemtax drop column  obj_uuid ;
alter table wo drop column  obj_uuid ;
alter table empgrp drop column  obj_uuid ;
alter table invcitemtax drop column  obj_uuid ;
alter table pr drop column  obj_uuid ;

drop trigger if exists itemsrc_did_change on itemsrc;
drop table if exists xt.emlprofile ;
drop table if exists xt.custemlprofile ;
drop table if exists xt.ext ;
drop table if exists xt.rptdef ;
drop table if exists xt.prjext ;
drop table if exists xt.prjtaskext ;
drop table if exists xt.obj_share ;
drop table if exists xt.custcustemlprofile ;
drop table if exists xt.extdep ;
drop table if exists xt.localeext ;
drop table if exists xt.wfsrc ;
drop table if exists xt.saletypewf ;
drop table if exists xt.salesemlprofile ;
drop table if exists xt.saletypeext ;
drop table if exists xt.prjemlprofile ;
drop table if exists xt.tskresource ;
drop table if exists xt.prjtypewf ;
drop table if exists xt.prjtypeext ;
drop table if exists xt.poemlprofile ;
drop table if exists xt.dict ;
drop table if exists xt.obj_type ;
drop table if exists xt.wftype ;


--cleanup cmnttypesource
DROP VIEW IF EXISTS  xm.quote_customer            ;
DROP VIEW IF EXISTS  xm.quote_list_item           ;
DROP VIEW IF EXISTS  xm.sales_order_customer      ;
DROP VIEW IF EXISTS  xm.customer_prospect_relation;
DROP VIEW IF EXISTS  xm.site                      ;
DROP VIEW IF EXISTS  xm.task                      ;
DROP VIEW IF EXISTS  xm.account_comment           ;
DROP VIEW IF EXISTS  xm.address_comment           ;
DROP VIEW IF EXISTS  xm.contact_comment           ;
DROP VIEW IF EXISTS  xm.customer_comment          ;
DROP VIEW IF EXISTS  xm.employee_comment          ;
DROP VIEW IF EXISTS  xm.incident_comment          ;
DROP VIEW IF EXISTS  xm.item_comment              ;
DROP VIEW IF EXISTS  xm.item_site_comment         ;
DROP VIEW IF EXISTS  xm.opportunity_comment       ;
DROP VIEW IF EXISTS  xm.project_comment           ;
DROP VIEW IF EXISTS  xm.project_task_comment      ;
DROP VIEW IF EXISTS  xm.quote_comment             ;
DROP VIEW IF EXISTS  xm.quote_line_comment        ;
DROP VIEW IF EXISTS  xm.sales_order_comment       ;
DROP VIEW IF EXISTS  xm.sales_order_line_comment  ;
DROP VIEW IF EXISTS  xm.site_comment              ;
DROP VIEW IF EXISTS  xm.task_comment              ;
DROP VIEW IF EXISTS  xm.to_do_comment             ;
DROP VIEW IF EXISTS  xm.comment_type              ;
DROP VIEW IF EXISTS  xm.comment_type_source       ;
ALTER TABLE cmnttypesource NO INHERIT xt.obj;
ALTER TABLE cmnttypesource DROP column obj_uuid;



--cleanup cntcteml
DROP VIEW IF EXISTS xm.contact_info;
DROP VIEW IF EXISTS xm.contact_email;
ALTER TABLE cntcteml NO INHERIT xt.obj;
ALTER TABLE cntcteml DROP column obj_uuid;



DROP view IF EXISTS xm.customer_group;
DROP view IF EXISTS xm.customer_group_customer;
ALTER TABLE custgrpitem NO INHERIT xt.obj;
ALTER TABLE custgrpitem DROP column obj_uuid;



DROP view IF EXISTS xm.item_group;
DROP view IF EXISTS xm.item_group_item;
ALTER TABLE itemgrpitem  NO INHERIT xt.obj;
ALTER TABLE itemgrpitem DROP column obj_uuid;



--cleanup cohead;
drop view if exists xt.coheadinfo;
drop view if exists xm.sales_order_relation;
drop view if exists xm.invoice_sales_order;
drop view if exists xm.sales_order_payment;
drop view if exists xm.invoice_sales_order;
drop view if exists xt.act;
drop view if exists xm.activity_relation;
drop view if exists xm.activity_list_item;
drop view if exists xt.share_users_cohead;
drop view if exists xt.share_users;
drop view if exists xm.share_users;
drop view if exists xm.address;
drop view if exists xm.vendor_list_item;
drop view if exists xm.invoice depends;
drop view if exists xm.invoice_list_item;

drop view if exists xt.coheadinfo;
drop view if exists xm.sales_order_relation;
drop view if exists xm.invoice_sales_order;
drop view if exists xm.invoice_sales_order;
drop view if exists xm.activity_relation;
drop view if exists xt.share_users_cohead;
drop view if exists xt.share_users;
drop view if exists xm.address;
drop view if exists xm.invoice;
drop view if exists xm.share_users;
drop view if exists xtstd.orditemship;
drop view if exists xtstd.ordhead;
drop view if exists xtstd.orditem;
drop view if exists xtstd.shipheadinfo;
drop view if exists xm.sales_order_relation ;
drop view if exists xm.sales_order_list_item;
drop view if exists sys.sales_order_relation;
drop view if exists xm.sales_order_relation;
drop view if exists xm.invoice_sales_order;
drop view if exists xm.invoice_sales_order;
drop view if exists xt.act;
drop view if exists xt.share_users_cohead;
drop view if exists xt.share_users;
drop view if exists xt.act;
drop view if exists xm.sales_order_workflow;
drop table if exists xt.coheadwf;
drop view if exists xt.coheadinfo;
drop view if exists xm.sales_order_relation;
drop view if exists xt.share_users_cohead;

ALTER TABLE cohead NO INHERIT xt.obj;
ALTER TABLE cohead DROP column if exists obj_uuid;


--cleanup cohist;
drop view xt.cohistinfo;
ALTER TABLE cohist NO INHERIT xt.obj;
ALTER TABLE cohist DROP column obj_uuid;

--cleanup coitem;
DROP view if exists xtstd.shipmentline;
DROP view if exists xt.shipmentline;
DROP view if exists xt.coitemship;
DROP view if exists xt.coiteminfo;
ALTER TABLE coitem NO INHERIT xt.obj;
ALTER TABLE coitem DROP column obj_uuid;

--cleanup comment
drop view xt.crmacctcomment;
ALTER TABLE comment NO INHERIT xt.obj;
ALTER TABLE comment DROP column obj_uuid;

--cleanup curr_rate
drop view xm.currency_rate;
ALTER TABLE curr_rate NO INHERIT xt.obj;
ALTER TABLE curr_rate DROP column obj_uuid;

--Cleanup te.teitem
DROP VIEW IF EXISTS xt.teiteminfo;
ALTER TABLE te.teitem NO INHERIT xt.obj;
ALTER TABLE te.teitem DROP column obj_uuid;

--cleanup docass;
DROP VIEW IF EXISTS  xm.account_account         ;
DROP VIEW IF EXISTS  xm.account_contact         ;
DROP VIEW IF EXISTS  xm.account_customer        ;
DROP VIEW IF EXISTS  xm.account_file            ;
DROP VIEW IF EXISTS  xm.account_incident        ;
DROP VIEW IF EXISTS  xm.account_opportunity     ;
DROP VIEW IF EXISTS  xm.account_project         ;
DROP VIEW IF EXISTS  xm.account_to_do           ;
DROP VIEW IF EXISTS  xm.account_url             ;
DROP VIEW IF EXISTS  xm.contact_account         ;
DROP VIEW IF EXISTS  xm.contact_contact         ;
DROP VIEW IF EXISTS  xm.contact_customer        ;
DROP VIEW IF EXISTS  xm.contact_file            ;
DROP VIEW IF EXISTS  xm.contact_incident        ;
DROP VIEW IF EXISTS  xm.contact_opportunity     ;
DROP VIEW IF EXISTS  xm.contact_project         ;
DROP VIEW IF EXISTS  xm.contact_to_do           ;
DROP VIEW IF EXISTS  xm.contact_url             ;
DROP VIEW IF EXISTS  xm.customer_account        ;
DROP VIEW IF EXISTS  xm.customer_contact        ;
DROP VIEW IF EXISTS  xm.customer_customer       ;
DROP VIEW IF EXISTS  xm.customer_file           ;
DROP VIEW IF EXISTS  xm.customer_project        ;
DROP VIEW IF EXISTS  xm.customer_url            ;
DROP VIEW IF EXISTS  xm.incident_account        ;
DROP VIEW IF EXISTS  xm.incident_contact        ;
DROP VIEW IF EXISTS  xm.incident_customer       ;
DROP VIEW IF EXISTS  xm.incident_file           ;
DROP VIEW IF EXISTS  xm.incident_incident       ;
DROP VIEW IF EXISTS  xm.incident_opportunity    ;
DROP VIEW IF EXISTS  xm.incident_project        ;
DROP VIEW IF EXISTS  xm.incident_to_do          ;
DROP VIEW IF EXISTS  xm.incident_url            ;
DROP VIEW IF EXISTS  xm.item_account            ;
DROP VIEW IF EXISTS  xm.item_contact            ;
DROP VIEW IF EXISTS  xm.item_customer           ;
DROP VIEW IF EXISTS  xm.item_file               ;
DROP VIEW IF EXISTS  xm.item_url                ;
DROP VIEW IF EXISTS  xm.opportunity_account     ;
DROP VIEW IF EXISTS  xm.opportunity_contact     ;
DROP VIEW IF EXISTS  xm.opportunity_customer    ;
DROP VIEW IF EXISTS  xm.opportunity_file        ;
DROP VIEW IF EXISTS  xm.opportunity_incident    ;
DROP VIEW IF EXISTS  xm.opportunity_opportunity ;
DROP VIEW IF EXISTS  xm.opportunity_project     ;
DROP VIEW IF EXISTS  xm.opportunity_to_do       ;
DROP VIEW IF EXISTS  xm.opportunity_url         ;
DROP VIEW IF EXISTS  xm.project_account         ;
DROP VIEW IF EXISTS  xm.project_contact         ;
DROP VIEW IF EXISTS  xm.project_customer        ;
DROP VIEW IF EXISTS  xm.project_file            ;
DROP VIEW IF EXISTS  xm.project_incident        ;
DROP VIEW IF EXISTS  xm.project_opportunity     ;
DROP VIEW IF EXISTS  xm.project_project         ;
DROP VIEW IF EXISTS  xm.project_to_do           ;
DROP VIEW IF EXISTS  xm.project_url             ;
DROP VIEW IF EXISTS  xm.quote_account           ;
DROP VIEW IF EXISTS  xm.quote_contact           ;
DROP VIEW IF EXISTS  xm.quote_file              ;
DROP VIEW IF EXISTS  xm.quote_incident          ;
DROP VIEW IF EXISTS  xm.quote_opportunity       ;
DROP VIEW IF EXISTS  xm.quote_project           ;
DROP VIEW IF EXISTS  xm.quote_to_do             ;
DROP VIEW IF EXISTS  xm.quote_url               ;
DROP VIEW IF EXISTS  xm.sales_order_account     ;
DROP VIEW IF EXISTS  xm.sales_order_contact     ;
DROP VIEW IF EXISTS  xm.sales_order_file        ;
DROP VIEW IF EXISTS  xm.sales_order_url         ;
DROP VIEW IF EXISTS  xm.to_do_account           ;
DROP VIEW IF EXISTS  xm.to_do_contact           ;
DROP VIEW IF EXISTS  xm.to_do_customer          ;
DROP VIEW IF EXISTS  xm.to_do_file              ;
DROP VIEW IF EXISTS  xm.to_do_incident          ;
DROP VIEW IF EXISTS  xm.to_do_opportunity       ;
DROP VIEW IF EXISTS  xm.to_do_project           ;
DROP VIEW IF EXISTS  xm.to_do_to_do             ;
DROP VIEW IF EXISTS  xm.to_do_url                                ;
DROP VIEW IF EXISTS  xt.cust_doc                ;
DROP VIEW IF EXISTS  xt.doc                  ;   

ALTER TABLE docass NO INHERIT xt.obj;
ALTER TABLE docass DROP column obj_uuid;


--cleanup empgrp;
DROP VIEW IF EXISTS  xm.employee_group_group   ;
DROP VIEW IF EXISTS  xm.employee_group         ;
DROP VIEW IF EXISTS  xm.employee_group_employee;
ALTER TABLE empgrpitem NO INHERIT xt.obj;
ALTER TABLE empgrpitem DROP column obj_uuid;

--cleanup file;
DROP VIEW IF EXISTS  xm.file          ;
DROP VIEW IF EXISTS  xm.file_relation ;
ALTER TABLE file NO INHERIT xt.obj;
ALTER TABLE file DROP column obj_uuid;

--cleanup grp;
DROP VIEW IF EXISTS  sys."user"                                   ;
DROP VIEW IF EXISTS  xm.user_account                              ;
DROP VIEW IF EXISTS  sys.user_account_user_account_role_assignment;
DROP VIEW IF EXISTS  xm.user_account_user_account_role_assignment ;
DROP VIEW IF EXISTS  sys.user_account_role                        ;
DROP VIEW IF EXISTS  xm.user_account_role                         ;
DROP VIEW IF EXISTS  xm.user_account_role_relation                ;

ALTER TABLE grp NO INHERIT xt.obj;
ALTER TABLE grp DROP column obj_uuid;

--cleanup grppriv

DROP VIEW IF EXISTS  xm.user_account_role_privilege_assignment;
ALTER TABLE grppriv NO INHERIT xt.obj;
ALTER TABLE grppriv DROP column obj_uuid;

--cleanup incdt

DROP VIEW IF EXISTS  xm.customer_incident_relation    ;
DROP VIEW IF EXISTS  xm.customer_to_do_relation       ;
DROP VIEW IF EXISTS  xm.incident_relation             ;
DROP VIEW IF EXISTS  xm.to_do_list_item               ;
DROP VIEW IF EXISTS  xm.to_do_relation                ;
DROP VIEW IF EXISTS  xt.incdtinfo                     ;
DROP VIEW IF EXISTS  xt.incdtxt                       ;
DROP VIEW IF EXISTS  xt.todoiteminfo                  ;


ALTER TABLE incdt NO INHERIT xt.obj;
ALTER TABLE incdt DROP column obj_uuid;


--cleanup incdthist
DROP VIEW IF EXISTS  xm.incident_history ;
ALTER TABLE incdthist NO INHERIT xt.obj;
ALTER TABLE incdthist DROP column obj_uuid;

--cleanup invdetail
DROP VIEW IF EXISTS  xm.inventory_detail;
ALTER TABLE invdetail NO INHERIT xt.obj;
ALTER TABLE invdetail DROP column obj_uuid;

--cleanup invhist
ALTER TABLE invhist NO INHERIT xt.obj;
ALTER TABLE invhist DROP column obj_uuid;

--cleanup itemalias 
drop view xm.item_alias;
ALTER TABLE itemalias NO INHERIT xt.obj;
ALTER TABLE itemalias DROP column obj_uuid;

--cleanup itemloc
drop view xm.item_site_detail;
drop view xt.itemsitedtl;
ALTER TABLE itemloc NO INHERIT xt.obj;
ALTER TABLE itemloc DROP column obj_uuid;

--cleanup itemsite
DROP VIEW IF EXISTS  xm.item_item_site_relation;
DROP VIEW IF EXISTS  xt.itemsiteinfo;
ALTER TABLE itemsite NO INHERIT xt.obj;
ALTER TABLE itemsite DROP column obj_uuid;

--cleanup location

drop view xm.item_site_location;
drop view xm.location_relation;
ALTER TABLE location NO INHERIT xt.obj;
ALTER TABLE location DROP column obj_uuid;

--cleanup locitem;
drop view xt.locitemsite;
ALTER TABLE locitem NO INHERIT xt.obj;
ALTER TABLE locitem DROP column obj_uuid;

--cleanup payco;
ALTER TABLE payco NO INHERIT xt.obj;
ALTER TABLE payco DROP column obj_uuid;

--cleanup pohead
drop view if exists xm.purchase_order_workflow;
drop view if exists xt.poheadinfo;
drop view if exists xm.purchase_order_workflow;
drop table xt.powf;
ALTER TABLE pohead NO INHERIT xt.obj;
ALTER TABLE pohead DROP column obj_uuid;

--cleanup poitem
ALTER TABLE poitem NO INHERIT xt.obj;
ALTER TABLE poitem DROP column obj_uuid;

--cleanup prjtask
drop view xm.task_list_item;
drop view xm.task_relation;
drop view xm.project_relation;
drop view xm.project_task_relation;
ALTER TABLE prjtask NO INHERIT xt.obj;
ALTER TABLE prjtask DROP column obj_uuid;


--cleanup quitem
DROP VIEW IF EXISTS  xt.quiteminfo                             ;
DROP FUNCTION xt.quote_line_base_price(quitem)          ;
DROP FUNCTION xt.quote_line_customer_discount(quitem)   ;
DROP FUNCTION xt.quote_line_extended_price(quitem)      ;
DROP FUNCTION xt.quote_line_list_price_discount(quitem) ;
DROP FUNCTION xt.quote_line_list_price(quitem)          ;
DROP FUNCTION xt.quote_line_margin(quitem)              ;
DROP FUNCTION xt.quote_line_markup(quitem)              ;
DROP FUNCTION xt.quote_line_tax(quitem)                 ;

ALTER TABLE quitem NO INHERIT xt.obj;
ALTER TABLE quitem DROP column obj_uuid;

--cleanup recur
DROP VIEW IF EXISTS  xm.incident_recurrence;
DROP VIEW IF EXISTS  xm.project_recurrence ;
DROP VIEW IF EXISTS  xm.to_do_recurrence   ;
ALTER TABLE recur NO INHERIT xt.obj;
ALTER TABLE recur DROP column obj_uuid;

--cleanup recv
ALTER TABLE recv NO INHERIT xt.obj;
ALTER TABLE recv DROP column obj_uuid;

--cleanup shiptoinfo
drop view if exists xm.customer_group;
drop view if exists xm.customer_relation;
drop view if exists xm.customer_group_customer;
drop view if exists xm.customer_relation;
drop view if exists xm.customer_list_item;
drop view if exists xm.customer_relation;
drop view if exists xm.customer_list_item ;
drop view if exists xm.customer_shipto_relation;
drop view if exists xm.customer_shipto;

ALTER TABLE shiptoinfo NO INHERIT xt.obj;
ALTER TABLE shiptoinfo DROP column obj_uuid;

--cleanup taxass
drop view if exists xm.tax_assignment;
ALTER TABLE taxass NO INHERIT xt.obj;
ALTER TABLE taxass DROP column obj_uuid;

--cleanup taxrate
drop view xm.tax_rate;
ALTER TABLE taxrate NO INHERIT xt.obj;
ALTER TABLE taxrate DROP column obj_uuid;

--cleanup taxreg
drop view xm.customer_tax_registration;
ALTER TABLE taxreg NO INHERIT xt.obj;
ALTER TABLE taxreg DROP column obj_uuid;

--cleanup todoitem

ALTER TABLE todoitem NO INHERIT xt.obj;
ALTER TABLE todoitem DROP column obj_uuid;

--cleanup tohead;

ALTER TABLE tohead NO INHERIT xt.obj;
ALTER TABLE tohead DROP column obj_uuid;

--cleanup toitem

ALTER TABLE toitem NO INHERIT xt.obj;
ALTER TABLE toitem DROP column obj_uuid;

--cleanup ls

ALTER TABLE ls NO INHERIT xt.obj;
ALTER TABLE ls DROP column obj_uuid;

--cleanup prjtask
DROP VIEW if exists xt.prjtaskinfo;
ALTER TABLE prjtask NO INHERIT xt.obj;
ALTER TABLE prjtask DROP column obj_uuid;

--cleanup urlinfo
DROP VIEW IF EXISTS  xm.url;
ALTER TABLE urlinfo NO INHERIT xt.obj;
ALTER TABLE urlinfo DROP column obj_uuid;
drop function xt.add_priv(text,text,text,text,text,text,boolean);
drop FUNCTION xt.grp_did_change();
drop table xt.bak_userpriv;
drop function if exists xt.grppriv_did_change();
drop function if exists xt.quote_line_extended_price(integer);
drop function if exists xt.quote_line_list_cost_markup(quitem);
drop function if exists xt.quote_line_tax(integer);
drop function if exists xt.quote_subtotal(integer) ;
drop function if exists xt.quote_tax_total(integer) ;
drop function if exists xt.quote_total(integer) ;
drop function if exists xt.useracct_did_change() ;
drop function if exists xt.usrgrp_did_change() ;
drop function if exists xt.usrpriv_did_change() ;
drop sequence if exists xt.priv_priv_id_seq ;
drop sequence if exists xt.useracct_useracct_id_seq ;



--cleanup usrgrp
ALTER TABLE usrgrp NO INHERIT xt.obj;
ALTER TABLE usrgrp DROP column obj_uuid;
DROP VIEW IF EXISTS  xm.user_account_privilege_assignment;
ALTER TABLE usrpriv NO INHERIT xt.obj;
ALTER TABLE usrpriv DROP column obj_uuid;
drop  view if exists xm.user_account_relation ;
drop  view if exists xm.contact_relation ;
drop  view if exists xm.sales_rep ;
drop  view if exists xm.ship_charge ;
drop  view if exists xm.ship_zone ;
drop  view if exists xm.tax_zone ;
drop  view if exists xm.customer_shipto ;
drop  view if exists xm.customer_relation ;
drop  view if exists xm.characteristic_option ;
drop  view if exists xm.characteristic ;
drop  view if exists xm.source ;
drop  view if exists xm.comment_type_source ;
drop  view if exists xm.comment_type ;
drop  view if exists xm.incident_relation ;
drop  view if exists xm.class_code ;
drop  view if exists xm.freight_class ;
drop  view if exists xm.item_relation_alias ;
drop  view if exists xm.item_relation_characteristic ;
drop  view if exists xm.unit ;
drop  view if exists xm.item_relation ;
drop  view if exists xm.opportunity_stage ;
drop  view if exists xm.opportunity_relation ;
drop  view if exists xm.project_relation ;
drop  view if exists xm.priority ;
drop  view if exists xm.to_do_relation ;
drop  view if exists xm.site_relation ;
drop  view if exists xm.currency ;
drop  view if exists xm.bank_account_relation ;
drop  view if exists xm.customer_group_customer ;
drop  view if exists xm.customer_group ;
drop  view if exists xm.customer_customer_group ;
drop  view if exists xm.customer_email_profile ;
drop  view if exists xm.customer_type ;
drop  view if exists xm.terms ;
drop  view if exists xm.billing_customer ;
drop  view if exists xm.cash_receipt_line_pending ;
drop  view if exists xm.receivable_relation ;
drop  view if exists xm.cash_receipt_receivable ;
drop  view if exists xm.cash_receipt_line_list_item ;
drop  view if exists xm.credit_card ;
drop  view if exists xm.sales_customer ;
drop  view if exists xm.reason_code ;
drop  view if exists xm.receivable_application ;
drop  view if exists xm.return_allocation ;
drop  view if exists xm.tax_authority ;
drop  view if exists xm.tax_class ;
drop  view if exists xm.tax_code ;
drop  view if exists xm.return_tax ;
drop  view if exists xm.tax_type ;
drop  view if exists xm.receivable_tax ;
drop  view if exists xm.return_line_tax ;
drop  view if exists xm.return_line ;
drop  view if exists xm.invoice_line_tax ;
drop  view if exists xm.sales_category ;
drop  view if exists xm.sale_type_characteristic ;
drop  view if exists xm.sale_type_workflow ;
drop  view if exists xm.sales_email_profile ;
drop  view if exists xm.item_source_price ;
drop  view if exists xm.vendor_relation ;
drop  view if exists xm.project_email_profile ;
drop  view if exists xm.project_task_characteristic ;
drop  view if exists xm.resource ;
drop  view if exists xm.task_resource ;
drop  view if exists xm.project_type_characteristic ;
drop  view if exists xm.project_type_workflow ;
drop  view if exists xm.project_type ;
drop  view if exists xm.project_workflow ;
drop  view if exists xm.project_list_item_characteristic ;
drop  view if exists xm.project_workflow_relation ;
drop  view if exists xm.purchase_email_profile ;
drop  view if exists xm.purchase_order_characteristic ;
drop  view if exists xm.purchase_order_comment ;
drop  view if exists xm.purchase_order_line_characteristic ;
drop  view if exists xm.purchase_order_line_comment ;
drop  view if exists xm.purchase_type_characteristic ;
drop  view if exists xm.purchase_type_workflow ;
drop  view if exists xm.purchase_type ;
drop  view if exists xm.vendor_address_relation ;
drop  view if exists xm.purchase_vendor_relation ;
drop  view if exists xm.purchase_order_list_item_characteristic ;
drop  view if exists xm.purchase_vendor_address ;
drop  view if exists xm.sales_order_characteristic ;
drop  view if exists xm.sales_order_incident ;
drop  view if exists xm.sales_order_opportunity ;
drop  view if exists xm.sales_order_project ;
drop  view if exists xm.sales_order_to_do ;
drop  view if exists xm.task_characteristic ;
drop  view if exists xm.task_list_item_characteristic ;
drop  view if exists xm.task_resource_analysis ;
drop  view if exists xm.user_account_role_list_item ;
drop  view if exists xm.vendor_address ;
drop  view if exists xm.vendor_characteristic ;
drop  view if exists xm.vendor_comment ;
drop  view if exists xm.vendor_list_item_characteristic ;

drop  view if exists xm.user_account_relation ;
drop view if exists xm.contact_relation ;
drop view if exists xm.sales_rep ;
drop view if exists xm.ship_charge ;
drop view if exists xm.ship_zone ;
drop view if exists xm.tax_zone ;
drop view if exists xm.customer_shipto ;
drop view if exists xm.customer_relation ;
drop view if exists xm.prospect_relation ;
drop view if exists xm.account_relation ;
drop view if exists xm.characteristic_option ;
drop view if exists xm.characteristic ;
drop view if exists xm.source ;
drop view if exists xm.comment_type_source ;
drop view if exists xm.comment_type ;
drop view if exists xm.file_relation ;
drop view if exists xm.incident_relation ;
drop view if exists xm.class_code ;
drop view if exists xm.freight_class ;
drop view if exists xm.item_relation_alias ;
drop view if exists xm.item_relation_characteristic ;
drop view if exists xm.unit ;
drop view if exists xm.item_relation ;
drop view if exists xm.opportunity_stage ;
drop view if exists xm.opportunity_relation ;
drop view if exists xm.project_relation ;
drop view if exists xm.priority ;
drop view if exists xm.to_do_relation ;
drop view if exists xm.url ;
drop view if exists xm.site_relation ;
drop view if exists xm.agent ;
drop view if exists xm.currency ;
drop view if exists xm.bank_account ;
drop view if exists xm.bank_account_relation ;
drop view if exists xm.customer_group_customer ;
drop view if exists xm.customer_group ;
drop view if exists xm.customer_customer_group ;
drop view if exists xm.customer_email_profile ;
drop view if exists xm.customer_type ;
drop view if exists xm.terms ;
drop view if exists xm.billing_customer ;
drop view if exists xm.cash_receipt_line_pending ;
drop view if exists xm.receivable_relation ;
drop view if exists xm.cash_receipt_receivable ;
drop view if exists xm.cash_receipt_line_list_item ;
drop view if exists xm.credit_card ;
drop view if exists xm.sales_customer ;
drop view if exists xm.cash_receipt ;
drop view if exists xm.reason_code ;
drop view if exists xm.receivable_application ;
drop view if exists xm.receivable_list_item ;
drop view if exists xm.remit_to ;
drop view if exists xm.return_allocation ;
drop view if exists xm.return_list_item ;
drop view if exists xm.return_relation ;
drop view if exists xm.cash_receipt_line ;
drop view if exists xm.cash_receipt_list_item ;
drop view if exists xm.cash_receipt_relation ;
drop view if exists xm.credit_card_payment ;
drop view if exists xm.tax_authority ;
drop view if exists xm.sales_customer_shipto_relation ;
drop view if exists xm.extension_dependency ;
drop view if exists xm.invoice_account ;
drop view if exists xm.invoice_allocation ;
drop view if exists xm.invoice_characteristic ;
drop view if exists xm.invoice_contact ;
drop view if exists xm.invoice_customer ;
drop view if exists xm.invoice_file ;
drop view if exists xm.invoice_incident ;
drop view if exists xm.invoice_item ;
drop view if exists xm.tax_class ;
drop view if exists xm.tax_code ;
drop view if exists xm.return_tax;
drop view if exists xm.tax_type ;
drop view if exists xm.receivable_tax;
drop view if exists xm.receivable;
drop view if exists xm.receivable;
drop view if exists xm.return_line_tax;
drop view if exists xm.return_line;
drop view if exists xm.invoice_line_tax ;
drop view if exists xm.sales_category ;
drop view if exists xm.invoice_line ;
drop view if exists xm.invoice_opportunity ;
drop view if exists xm.invoice_project ;
drop view if exists xm.invoice_relation ;
drop view if exists xm.invoice_tax ;
drop view if exists xm.invoice_url ;
drop view if exists xm.sale_type_characteristic ;
drop view if exists xm.sale_type_workflow ;
drop view if exists xm.sales_email_profile ;
drop view if exists xm.sale_type ;
drop view if exists xm.return;
drop view if exists xm.item_group_relation ;
drop view if exists xm.item_source_price ;
drop view if exists xm.vendor_relation ;
drop view if exists xm.item_source ;
drop view if exists xm.item_source_manufacturer ;
drop view if exists xm.project_characteristic ;
drop view if exists xm.project_email_profile ;
drop view if exists xt.aropeninfo;
drop view if exists xt.cashrcptitem_pending   ;
drop view if exists xt.cmheadtaxinfo          ;
drop view if exists xt.cmiteminfo             ;
drop view if exists xt.cmitemtaxinfo          ;
drop view if exists xt.crmacctaddr            ;
drop view if exists xt.crmacct_users   ;
drop view if exists xt.custitem        ;
drop view if exists xt.invcheadinfo    ;
drop view if exists xt.invciteminfo    ;
drop view if exists xt.invcitemtaxinfo ;
drop view if exists xt.itemsrcmfg                ;
drop view if exists xt.obj_uuid                  ;
drop view if exists xt.poiteminfo                ;
drop view if exists xt.receivable_applications   ;
drop view if exists xt.receivable_invoice_return ;
drop view if exists xt.remittoinfo        ;
drop view if exists xt.resource           ;
drop view if exists xt.share_users_addr   ;
drop view if exists xt.share_users_cntct  ;
drop view if exists xt.share_users_cust   ;
drop view if exists xt.share_users_default     ;
drop view if exists xt.share_users_invchead    ;
drop view if exists xt.share_users_shipto      ;
drop view if exists xt.share_users_shipto_addr ;
drop view if exists xt.share_users_shipto_cntct;
drop view if exists xt.shiptoitem         ;
drop view if exists xt.sochild            ;
drop view if exists xt.tskresourceanalysis;
drop view if exists xt.vendaddrxt     ;    
drop view if exists sys.customer_email_profile             ;
drop view if exists sys.file                               ;
drop view if exists sys.privilege                          ;
drop view if exists sys.report_definition                  ;
drop view if exists sys.user_account_privilege_assignment ;
drop view if exists sys.recover;
drop view if exists sys.oauth2client;
drop view if exists sys.oauth2client_redirs;
drop view if exists sys.oauth2token;
drop view if exists sys.customer_relation;
drop view if exists sys.client_code_relation;
drop view if exists sys.user_extension;
drop view if exists sys.user_account_role_extension;
drop view if exists sys.user_extension;
drop view if exists sys.user_account_role_extension;
drop view if exists sys.extension;
drop view if exists sys.client_code;
drop view if exists sys.bi_cache;
drop view if exists sys.session_store;
drop trigger if exists sales_order_did_change on cohead;
drop trigger if exists aropen_did_change on aropen ;
drop trigger if exists ccpay_did_change on ccpay ;
drop trigger if exists cmhead_did_change on cmhead ;
drop trigger if exists payco_did_change on payco ;
drop trigger if exists pohead_did_change on pohead ;
drop trigger if exists rsncode_did_change on rsncode ;
drop trigger if exists salescat_did_change on salescat ;
drop trigger if exists itemsrc_vendor_item_number_did_change on itemsrc;
drop trigger if exists customer_did_change on custinfo;
drop function xt.customer_did_change();
drop function if exists xt.itemsrc_did_change() ;
drop function if exists xt.obj_type_did_change() ;
drop function if exists xt.record_did_change() ;
drop function if exists xt.register_extension_;
drop function if exists xt.sales_order_did_change() ;



drop function if exists xt.register_extension_dependency(text,text);
drop function if exists xt.set_dictionary(text,text,text) ;
drop table if exists xt.sharetype;
drop function if exists xt.sharetype_did_change() ;
drop table if exists xt.sordtype;
drop function if exists xt.sordtype_did_change() ;
drop function if exists xt.workflow_notify(uuid) ;
drop table if exists xt.poheadext;
drop table if exists xt.potypewf;
drop table if exists xt.potype;

drop function if exists xt.record_did_change() ;
drop function if exists xt.obj_type_did_change() ;

drop function if exists xt.acttype_did_change() ;
drop function if exists xt.add_report_definition(text,integer,text) ;
drop function if exists xt.add_role(text,text) ;
drop operator if exists <@(uuid,uuid[]) ;
drop function if exists xt.any_uuid(uuid,uuid[]) ;
drop function if exists xt.ar_balance(aropen) ;
drop function if exists xt.ar_tax_total(integer) ;
drop function if exists xt.cashrcpt_applied_amount(numeric,boolean) ;
drop function if exists xt.cashrcpt_balance(numeric,numeric) ;
drop function if exists xt.cashrcpt_receivable_balance(numeric) ;
drop function if exists xt.cashrcpt_receivable_sum_amount(numeric,boolean) ;
drop function if exists xt.cm_balance(integer,numeric,numeric,integer,date,integer,text) ;
drop function if exists xt.cm_line_tax_total(integer) ;
drop function if exists xt.cm_subtotal(integer) ;
drop function if exists xt.cm_tax_total(integer) ;
drop function if exists xt.cm_total(integer,numeric,numeric) ;
drop function if exists xt.co_authorized_credit(text) ;
drop TABLE xt.acttype;
drop function if exists xt.acttype_did_change() ;
drop function if exists xt.any_uuid(uuid,uuid[]) ;
drop function if exists xt.ar_balance(aropen) ;
drop function if exists xt.ar_tax_total(integer) ;
drop function if exists xt.cust_outstanding_credit(integer,integer,date) ;
drop function if exists xt.customer_did_change() ;
drop function if exists xt.acttype_did_change() ;
drop function if exists xt.ar_balance(aropen) ;
drop function if exists xt.ar_tax_total(integer) ;
drop function if exists xt.cust_outstanding_credit(integer,integer,date) ;
drop function if exists xt.findxt() ;
drop function if exists xt.grant_role_ext(text,text) ;
drop function if exists xt.grant_role_priv(text,text,text) ;
drop function if exists xt.grant_user_role(text,text) ;
drop function if exists xt.invc_allocated_credit(integer,integer,date) ;
drop function if exists xt.invc_authorized_credit(text) ;
drop function if exists xt.invc_line_extended_price(numeric,numeric,numeric,numeric) ;
drop function if exists xt.invc_outstanding_credit(integer,integer,date) ;
drop function if exists xt.invc_subtotal(invchead) ;
drop function if exists xt.invc_tax_total(integer) ;
drop function if exists xt.invc_total(invchead) ;
drop function if exists xt.itemsrc_did_change() ;
drop function if exists xt.obj_type_did_change() ;
drop function if exists xt.po_freight_subtotal(pohead) ;
drop function if exists xt.po_line_extended_price(poitem) ;
drop function if exists xt.po_line_tax(poitem) ;
drop function if exists xt.po_schedule_date(pohead) ;
drop function if exists xt.po_subtotal(pohead) ;
drop function if exists xt.po_tax_total(pohead) ;
drop function if exists xt.po_total(pohead) ;
drop function if exists xt.prj_actual_exp(integer) ;
drop function if exists xt.prj_actual_hrs(integer) ;
drop function if exists xt.prj_balance_exp(integer) ;
drop function if exists xt.prj_balance_hrs(integer) ;
drop function if exists xt.prj_budget_exp(integer) ;
drop function if exists xt.prj_budget_hrs(integer) ;
drop function if exists xt.acttype_did_change() ;
drop function if exists xt.ar_balance(aropen) ;
drop function if exists xt.ar_tax_total(integer) ;
drop function if exists xt.cust_outstanding_credit(integer,integer,date) ;
drop function if exists xt.invc_allocated_credit(integer,integer,date) ;
drop function if exists xt.invc_authorized_credit(text) ;
drop function if exists xt.invc_subtotal(invchead) ;
drop function if exists xt.invc_tax_total(integer) ;
drop function if exists xt.invc_total(invchead) ;
drop function if exists xt.itemsrc_did_change() ;
drop function if exists xt.obj_type_did_change() ;
drop function if exists xt.po_line_extended_price(poitem) ;
drop function if exists xt.po_line_tax(poitem) ;
drop function if exists xt.record_did_change() ;
drop function if exists xt.register_extension_;
drop function if exists xt.sales_order_did_change() ;


DROP TRIGGER IF EXISTS whsinfo_did_change on whsinfo;
DROP TRIGGER IF EXISTS whsezone_did_change on whsezone;
DROP TRIGGER IF EXISTS uom_did_change on uom ;
DROP TRIGGER IF EXISTS todoitem_did_change on todoitem;
DROP TRIGGER IF EXISTS terms_did_change on terms;
DROP TRIGGER IF EXISTS state_did_change on state;
DROP TRIGGER IF EXISTS sitetype_did_change on sitetype;
DROP TRIGGER IF EXISTS shipzone_did_change on shipzone;
DROP TRIGGER IF EXISTS shipvia_did_change on shipvia;
DROP TRIGGER IF EXISTS shiphead_did_change on shiphead;
DROP TRIGGER IF EXISTS shipchrg_did_change on shipchrg;
DROP TRIGGER IF EXISTS shift_did_change on shift;
DROP TRIGGER IF EXISTS saletype_did_change on saletype;
DROP TRIGGER IF EXISTS salesrep_did_change on salesrep;
DROP TRIGGER IF EXISTS recv_did_change on recv;
DROP TRIGGER IF EXISTS quhead_did_change on quhead;
DROP TRIGGER IF EXISTS prospect_did_change on prospect;
DROP TRIGGER IF EXISTS prodcat_did_change on prodcat;
DROP TRIGGER IF EXISTS prj_did_change on prj;
DROP TRIGGER IF EXISTS plancode_did_change on plancode;
DROP TRIGGER IF EXISTS optype_did_change on optype;
DROP TRIGGER IF EXISTS opstage_did_change on opstage;
DROP TRIGGER IF EXISTS opsource_did_change on opsource;
DROP TRIGGER IF EXISTS ophead_did_change on ophead;
DROP TRIGGER IF EXISTS location_did_change on location;
DROP TRIGGER IF EXISTS itemsite_did_change on itemsite;
DROP TRIGGER IF EXISTS item_did_change on item;
DROP TRIGGER IF EXISTS incdtseverity_did_change on incdtseverity;
DROP TRIGGER IF EXISTS incdtresolution_did_change on incdtresolution ;
DROP TRIGGER IF EXISTS incdtpriority_did_change on incdtpriority;
DROP TRIGGER IF EXISTS incdtcat_did_change on incdtcat;
DROP TRIGGER IF EXISTS incdt_did_change on incdt;
DROP TRIGGER IF EXISTS hnfc_did_change on hnfc;
DROP TRIGGER IF EXISTS freightclass_did_change on freightclass;
DROP TRIGGER IF EXISTS file_did_change on file;
DROP TRIGGER IF EXISTS expcat_did_change on expcat;
DROP TRIGGER IF EXISTS empgrp_did_change on empgrp;
DROP TRIGGER IF EXISTS emp_did_change on emp;
DROP TRIGGER IF EXISTS dept_did_change on dept;
DROP TRIGGER IF EXISTS custtype_did_change on custtype;
DROP TRIGGER IF EXISTS custinfo_did_change on custinfo;
DROP TRIGGER IF EXISTS custgrp_did_change on custgrp;
DROP TRIGGER IF EXISTS curr_symbol_did_change on curr_symbol;
DROP TRIGGER IF EXISTS crmacct_did_change on crmacct;
DROP TRIGGER IF EXISTS country_did_change on country;
DROP TRIGGER IF EXISTS costcat_did_change on costcat;
DROP TRIGGER IF EXISTS cohead_did_change on cohead;
DROP TRIGGER IF EXISTS cntct_did_change on cntct;
DROP TRIGGER IF EXISTS classcode_did_change on classcode;
DROP TRIGGER IF EXISTS char_did_change on "char";
DROP TRIGGER IF EXISTS addr_did_change on addr;
DROP function IF EXISTS xt.mergecrmaccts(integer,boolean);
DROP function IF EXISTS xt.is_date(text);
DROP function IF EXISTS xt.install_orm(text);
DROP function IF EXISTS xt.install_js(text,text,text,text,boolean);
DROP function IF EXISTS xt.install_guiscript(text,text);
DROP function IF EXISTS xt.insert_client(text,text,text,text);
DROP function IF EXISTS xt.getschema(text,text);
DROP function IF EXISTS xt.get_id(text,text,text,text,text);
DROP function IF EXISTS xt.get(text);
DROP function IF EXISTS xt.execute_query(text);
DROP operator IF EXISTS ~?(text,text);
DROP function IF EXISTS xt.ends_with(text,text);
DROP function IF EXISTS xt.delete(text);
DROP function IF EXISTS xt.decamelize(text);
DROP function IF EXISTS xt.createuser(text,boolean);
DROP function IF EXISTS xt.create_view(text,text,boolean);
DROP function IF EXISTS xt.create_table(text,text,boolean,text);
DROP function IF EXISTS xt.comment_did_change();
DROP function IF EXISTS xt.co_total_cost(cohead);
DROP function IF EXISTS xt.co_total(cohead);
DROP function IF EXISTS xt.co_tax_total(cohead);
DROP function IF EXISTS xt.co_subtotal(cohead);
DROP function IF EXISTS xt.co_schedule_date(cohead);
DROP function IF EXISTS xt.co_margin(cohead);
DROP function IF EXISTS xt.mergecrmaccts(integer,boolean) ;
DROP function IF EXISTS xt.js_init(boolean) ;
DROP function IF EXISTS xt.is_date(text) ;
DROP function IF EXISTS xt.install_orm(text) ;
DROP function IF EXISTS xt.install_js(text,text,text,text,boolean) ;
DROP function IF EXISTS xt.co_line_tax(coitem) ;
DROP function IF EXISTS xt.co_line_ship_balance(coitem) ;
DROP function IF EXISTS xt.co_line_markup(coitem) ;
DROP function IF EXISTS xt.co_line_margin(coitem) ;
DROP function IF EXISTS xt.co_line_list_price_discount(coitem) ;
DROP function IF EXISTS xt.co_line_list_price(coitem) ;
DROP function IF EXISTS xt.co_line_extended_price(coitem) ;
DROP function IF EXISTS xt.co_line_customer_discount(coitem) ;
DROP function IF EXISTS xt.co_line_base_price(coitem) ;
DROP function IF EXISTS xt.co_line_at_shipping(coitem) ;
DROP function IF EXISTS xt.co_freight_weight(cohead) ;
DROP function IF EXISTS xt.co_allocated_credit(cohead) ;
DROP function IF EXISTS xt.cntctrestore(integer) ;
DROP function IF EXISTS xt.cntctmerge(integer,integer,boolean) ;
DROP function IF EXISTS xt.check_password(text) ;
DROP function IF EXISTS xt.change_password(text) ;
DROP operator IF EXISTS ~^(text,text);
DROP function IF EXISTS xt.begins_with(text,text) ;
DROP trigger IF EXISTS orm_did_change on xt.orm;
DROP VIEW IF EXISTS  xm.prospect;
DROP VIEW IF EXISTS  xm.quote_relation;
DROP VIEW IF EXISTS  xt.quheadinfo;
DROP FUNCTION IF EXISTS xt.record_did_change();
DROP function IF EXISTS xt.register_extension(text,text,text,text,integer) ;
DROP function IF EXISTS xt.raise_exception(text) ;
DROP function IF EXISTS xt.quote_total_cost(quhead) ;
DROP function IF EXISTS xt.quote_total(quhead) ;
DROP function IF EXISTS xt.quote_tax_total(quhead) ;
DROP function IF EXISTS xt.quote_subtotal(quhead) ;
DROP function IF EXISTS xt.quote_schedule_date(quhead) ;
DROP function IF EXISTS xt.quote_margin(quhead) ;
DROP function IF EXISTS xt.quote_freight_weight(quhead) ;
DROP TABLE IF EXISTS xt.orm;
DROP operator IF EXISTS !<@(text,text[]);
DROP operator IF EXISTS <@(text,text[]);
DROP operator IF EXISTS <@(numeric,numeric[]);
DROP operator IF EXISTS !<@(numeric,numeric[]);
DROP function IF EXISTS xt.orm_did_change() ;
DROP function IF EXISTS xt.not_any_text(text,text[]) ;
DROP function IF EXISTS xt.not_any_numeric(numeric,numeric[]) ;
DROP function IF EXISTS xt.any_text(text,text[]) ;
DROP function IF EXISTS xt.any_numeric(numeric,numeric[]) ;
DROP function IF EXISTS xt.add_priv(text,text,text,text) ;
DROP function IF EXISTS xt.add_primary_key(text,text,text) ;
DROP function IF EXISTS xt.add_inheritance(text,text) ;
DROP function IF EXISTS xt.add_index(text,text,text,text,text) ;
DROP function IF EXISTS xt.add_constraint(text,text,text,text) ;
DROP function IF EXISTS xt.add_column(text,text,text,text,text,text) ;
DROP table IF EXISTS xt.userpref ;
DROP table IF EXISTS xt.pkguiform ;
DROP table IF EXISTS xt.pkgscript ;
DROP table IF EXISTS xt.pkgreport ;
DROP table IF EXISTS xt.pkgpriv ;
DROP table IF EXISTS xt.pkgmetasql ;
DROP table IF EXISTS xt.pkgimage ;
DROP table IF EXISTS xt.pkgcmdarg ;
DROP table IF EXISTS xt.pkgcmd ;
DROP table IF EXISTS xt.ordtype ;
DROP view  IF EXISTS xt.orderiteminfo ;
DROP VIEW if EXISTS xm.incident_category  ;     
DROP VIEW if EXISTS xm.incident_email_profile  ;
DROP VIEW if EXISTS xm.incident_resolution     ;
DROP VIEW if EXISTS xm.incident_severity;
DROP view xm.user_account_extension;
DROP view xm.user_account_role_extension;
DROP view xm.user_account_extension;
DROP view xm.user_account_role_extension;
DROP view xm.extension;
DROP view IF EXISTS xt.orderheadinfo ;
DROP table IF EXISTS xt.lock ;
DROP table IF EXISTS xt.js ;
DROP table IF EXISTS xt.incdtcatemlprofile;
DROP table IF EXISTS xt.incdtemlprofile;
DROP table IF EXISTS xt.emlprofile ;
DROP view IF EXISTS xt.customer_prospect ;
DROP view IF EXISTS xt.crmacctaddr ;
DROP view IF EXISTS xt.site ;
DROP view IF EXISTS xt.prjinfo ;
DROP view IF EXISTS xt.opheadinfo ;
DROP view IF EXISTS xt.iteminfo ;
DROP view xt.usrinfo ;
DROP table xt.sessionstore ;
DROP table xt.recover ;
DROP table xt.oa2token ;
DROP table xt.oa2client ;
DROP table xt.oa2clientredirs ;
DROP trigger usrpref_did_change on usrpref;
DROP function xt.usrpref_did_change();
DROP function xt.usr_did_change();
DROP function xt.undomerge(text,text,integer) ;
DROP function xt.trylock(integer,integer) ;
DROP operator <(text,date);
DROP function xt.text_lt_date(text,date) ;
DROP operator >(text,date);
DROP function xt.text_gt_date(text,date);
DROP trigger quitem_taxtype_change on quitem;
DROP trigger coitem_taxtype_change on coitem;
DROP function xt.taxtype_record_did_change();
DROP view xt.shipheadinfo;
DROP function xt.shipment_value(shiphead);
DROP function xt.post(text);
DROP function xt.pg_advisory_unlock(integer,integer);
DROP function xt.patch(text);
DROP function xt.owner_record_did_change();
DROP trigger todoitem_owner_change on todoitem;
DROP trigger prjtask_owner_change on  prjtask;
DROP trigger prj_owner_change on prj;
DROP trigger ophead_owner_change on ophead;
DROP trigger indct_owner_change on incdt;
DROP trigger crmacct_owner_change on crmacct;
DROP trigger cntct_owner_change on cntct;
DROP function xt.generate_uuid();
DROP table xt.ver;
DROP table xt.incdtemlprofile;
DROP table xt.emlprofile;
DROP view xt.customer_prospect;
DROP table xt.oa2client;
DROP table xt.ext;
drop function xt.generate_uuid();
DROP view xm.account_relation ;
DROP view xm.source ;
DROP view xm.address_info ;
DROP view xm.contact_relation ;
DROP view xm.sales_rep ;
DROP view xm.tax_zone ;
DROP view xm.opportunity_stage ;
DROP view xm.department ;
DROP view xm.employee_employee_relation ;
DROP view xm.shift ;
DROP view xm.site_relation ;
DROP view xm.tax_authority_relation ;
DROP view xm.country ;
DROP view xm.shipment_sales_order ;
DROP view xm.currency ;
DROP view xm.customer_type ;
DROP view xm.site_type ;
DROP view xm.extension ;
DROP view xm.language ;
DROP view xm.incident_email_profile ;
DROP view xm.item_group_item ;
DROP view xm.tax_class ;
DROP view xm.user_account_relation;
DROP view xm.contact_relation ;
DROP view xm.address_info ;
DROP table xt.usrlite ;
DROP view xt.cntctinfo ;
DROP view if exists xm.sales_rep ;
DROP view if exists xm.ship_charge ;
DROP view if exists xm.ship_zone ;
DROP view if exists xm.tax_zone ;
DROP view if exists xm.class_code ;
DROP view if exists xm.freight_class ;
DROP view if exists xm.unit ;
DROP view if exists xm.opportunity_stage ;
DROP view if exists xm.opportunity_relation ;
DROP view if exists xm.priority ;
DROP view if exists xm.department ;
DROP view if exists xm.employee_employee_relation ;
DROP view if exists xm.shift ;
DROP view if exists xm.site_relation ;
DROP view if exists xm.employee_relation ;
DROP view if exists xm.prospect_relation ;
DROP view if exists xm.tax_authority_relation ;
DROP view if exists xm.account_address_list_item ;
DROP view if exists xm.cost_category ;
DROP view if exists xm.country ;
DROP view if exists xm.currency ;
DROP view if exists xm.customer_contact_relation ;
DROP view if exists xm.customer_opportunity_relation ;
DROP view if exists xm.tax_authority ;
DROP view if exists xm.customer_type ;
DROP view if exists xm.terms ;
DROP view if exists xm.customer_prospect_list_item ;
DROP view if exists xm.site_type ;
DROP view if exists xm.site_zone ;
DROP view if exists xm.extension ;
DROP view if exists xm.language ;
DROP view if exists xm.locale ;
DROP view if exists xm.privilege ;
DROP view if exists xm.user_account_extension ;
DROP view if exists xm.user_account_role_extension ;
DROP view if exists xm.user_chart ;
DROP view if exists xm.expense_category ;
DROP view if exists xm.filter ;
DROP view if exists xm.honorific ;
DROP view if exists xm.incident_email_profile ;
DROP view if exists xm.incident_category ;
DROP view if exists xm.incident_resolution ;
DROP view if exists xm.incident_severity ;
DROP view if exists xm.planner_code ;
DROP view if exists xm.shipment_sales_order ;
DROP view if exists xm.shipment_relation ;
DROP view if exists xm.product_category ;
DROP view if exists xm.item_group_item ;
DROP view if exists xm.item_group ;
DROP view if exists xm.ledger_account ;
DROP view if exists xm.ledger_account_relation ;
DROP view if exists xm.site_zone_relation ;
DROP view if exists xm.opportunity_source ;
DROP view if exists xm.opportunity_type ;
DROP view if exists xm.project_list_item ;
DROP view if exists xm.vendor_type ;
DROP view if exists xm.tax_type ;
DROP view if exists xm.sale_type ;
DROP view if exists xm.ship_via ;
DROP view if exists xm.shipment_list_item ;
DROP view if exists xm.site_list_item ;
DROP view if exists xm.state ;
DROP view if exists xm.task_project_relation ;
DROP view if exists xm.tax_class ;
DROP view if exists xm.tax_code ;
DROP table xt.obj ;
DROP function xt.owner_record_did_change() ;
DROP function xt.shipment_value(shiphead) ;
DROP table xt.clientcode ;
DROP table xt.ext ;
DROP table xt.oa2clientredirs ;
DROP table xt.oa2client ;
DROP table xt.grpext ;
DROP table xt.usrext ;
DROP table xt.usrlite ;
DROP view xt.cntctinfo ;
DROP view xt.opheadinfo ;
DROP view xt.prjinfo ;
DROP view xt.site ;
DROP view xt.crmacctaddr ;
DROP view xt.customer_prospect ;
DROP table xt.fltr ;
DROP table xt.emlprofile ;
DROP table xt.incdtemlprofile ;
DROP table xt.incdtcatemlprofile ;
DROP view xt.shipheadinfo ;
DROP table xt.usrchart;
DROP table xt.fltr;
DROP table xt.obj;
DROP table xt.usrext;
DROP table xt.grpext;
DROP table xt.clientcode;
DROP table xt.usrchart ;
DROP TABLE xt.grpext;
DROP TABLE xt.usrext;
DROP table xt.ext ;
DROP table xt.bicache ;
DROP view xm.shipment_sales_order;
DROP view xm.user_account_relation ;
DROP view xm.account_relation ;
DROP view xm.address_info ;
DROP view xm.contact_relation ;
DROP view xm.sales_rep ;
DROP view xm.tax_zone ;
DROP view xm.opportunity_stage ;
DROP view xm.department ;
DROP view xm.employee_employee_relation ;
DROP view xm.shift ;
DROP view xm.site_relation ;
DROP view xm.tax_authority_relation ;
DROP view xm.country ;
DROP view xm.currency ;
DROP view xm.customer_type ;
DROP view xm.site_type ;
DROP view xm.language ;
DROP view xm.incident_email_profile ;
DROP view xm.shipment_sales_order ;
DROP view xm.tax_class ;
DROP function xt.generate_uuid();
DROP function xt.shipment_value(shiphead);
DROP table xt.usrlite;
DROP view xt.cntctinfo;
DROP view xt.site;
DROP table xt.incdtemlprofile;
DROP table xt.emlprofile;

drop view if exists xm.account_relation;
drop view if exists xm.characteristic_option;
drop view if exists xm.characteristic;
drop view if exists xm.source;
drop view if exists xm.comment_type_source;
drop view if exists xm.comment_type;
drop view if exists xm.address_info;
drop view if exists xm.contact_relation;
drop view if exists xm.sales_rep;
drop view if exists xm.ship_charge;
drop view if exists xm.ship_zone;
drop view if exists xm.tax_zone;
drop view if exists xm.customer_shipto;
drop view if exists xm.customer_relation;
drop view if exists xm.file_relation;
drop view if exists xm.incident_relation;
drop view if exists xm.class_code;
drop view if exists xm.freight_class;
drop view if exists xm.item_relation_characteristic;
drop view if exists xm.unit;
drop view if exists xm.item_relation;
drop view if exists xm.opportunity_stage;
drop view if exists xm.opportunity_relation;
drop view if exists xm.project_task_relation;
drop view if exists xm.project_relation;
drop view if exists xm.priority;
drop view if exists xm.to_do_relation;
drop view if exists xm.currency;
drop view if exists xm.registration_type;
drop view if exists xm.sales_order_relation;
drop view if exists xm.shipment_sales_order;
drop view if exists xm.shipment_relation;
drop view if exists xm.trace_relation;
drop view if exists xm.account_trace_registration;
drop view if exists xm.url;
drop view if exists xm.department;
drop view if exists xm.employee_employee_relation;
drop view if exists xm.shift;
drop view if exists xm.site_relation;
drop view if exists xm.employee_relation;
drop view if exists xm.shipment_order;
drop view if exists xm.shipment_multi_list_item;
drop view if exists xm.shipment_multi_relation;
drop view if exists xm.task_project_relation;
drop view if exists xm.task_relation;
drop view if exists xm.to_do_alarm;
drop view if exists xm.worksheet_account;
drop view if exists xm.worksheet_expense;
drop view if exists xm.worksheet_file;
drop view if exists xm.worksheet_incident;
drop view if exists xm.worksheet_item;
drop view if exists xm.worksheet_time;
drop view if exists xm.worksheet_url;
drop view if exists xm.worksheet;
drop view if exists xm.worksheet_contact;
drop view if exists xm.worksheet_list_item;
drop view if exists xm.incident_alarm;
drop view if exists xm.location_relation;
drop view if exists xm.trace_characteristic;
drop view if exists xm.trace_comment;
drop view if exists xm.trace_registration;
drop view if exists xm.trace;
drop view if exists xm.item_site_detail;
drop view if exists xm.item_site_inventory;
drop view if exists xm.order_relation;
drop view if exists xm.issue_to_shipping_multi;
drop view if exists xm.trace_sequence;
drop view if exists xm.order_line;
drop view if exists xm.ship_shipment_line_multi;
drop view if exists xm.ship_shipment_multi;
drop view if exists xm.ship_shipment_multi;
drop view if exists xm.shipment_line_multi;
drop view if exists xm.shipment_multi;
drop view if exists xm.shipment_multi;
drop view if exists xm.ship_shipment_line_multi;
drop view if exists xm.shipment_line_multi;
drop view if exists xm.order_list_item;
drop view if exists xm.project_account;
drop view if exists xm.project_comment;
drop view if exists xm.project_contact;
drop view if exists xm.project_customer;
drop view if exists xm.project_file;
drop view if exists xm.project_incident;
drop view if exists xm.project_item;
drop view if exists xm.project_opportunity;
drop view if exists xm.project_project;
drop view if exists xm.project_recurrence;
drop view if exists xm.project_task_alarm;
drop view if exists xm.project_task_comment;
drop view if exists xm.project_task;
drop view if exists xm.project_to_do;
drop view if exists xm.project_url;
drop view if exists xm.project;
drop view if exists xm.worksheet_project;
drop view if exists xt.teheadinfo;
drop view if exists xt.teprjinfo;
drop view if exists xt.teprjtaskinfo;
drop view if exists xt.teexpinfo;
drop view if exists xt.tecustrateinfo;
drop function if exists xt.co_line_at_shipping(coitem) ;
drop function if exists xt.co_line_base_price(coitem) ;
drop function if exists xt.co_line_customer_discount(coitem) ;
drop function if exists xt.co_line_extended_price(coitem) ;
drop function if exists xt.co_line_list_price(coitem) ;
drop function if exists xt.co_line_list_price_discount(coitem) ;
drop function if exists xt.co_line_margin(coitem) ;
drop function if exists xt.co_line_markup(coitem) ;
drop function if exists xt.co_line_ship_balance(coitem) ;
drop function if exists xt.co_line_tax(coitem) ;
drop function if exists xt.co_schedule_date(cohead) ;
drop function if exists xt.te_invoiced_state(integer) ;
drop function if exists xt.te_invoiced_value(integer) ;
drop function if exists xt.te_posted_state(integer) ;
drop function if exists xt.te_posted_value(integer) ;
drop function if exists xt.te_to_invoice(integer) ;
drop function if exists xt.te_to_voucher(integer) ;
drop function if exists xt.te_total_expenses(integer) ;
drop function if exists xt.te_total_hours(integer) ;
drop function if exists xt.te_vouchered_state(integer) ;
drop function if exists xt.te_vouchered_value(integer) ;
drop function if exists xt.teitem_did_change() ;
drop function if exists xt.te_invoiced_state(integer) ;
drop function if exists xt.te_invoiced_value(integer) ;
drop function if exists xt.te_posted_state(integer) ;
drop function if exists xt.te_posted_value(integer) ;
drop function if exists xt.te_to_invoice(integer) ;
drop function if exists xt.te_to_voucher(integer) ;
drop function if exists xt.te_total_expenses(integer) ;
drop function if exists xt.te_total_hours(integer) ;
drop function if exists xt.te_vouchered_state(integer) ;
drop function if exists xt.te_vouchered_value(integer) ;
drop function if exists xt.generate_uuid();
drop table if exists xt.obj;
drop function if exists xt.uuid_generate_v4();
-- drop function if exists xtstd.to_line_at_shipping(toitem) 
-- drop function if exists xtstd.to_line_ship_balance(toitem)

DROP SCHEMA sys;
DROP SCHEMA xm;
DROP SCHEMA xt;
ALTER TABLE pkghead DISABLE TRIGGER ALL;
DELETE FROM pkghead WHERE pkghead_name='xt';
ALTER TABLE pkghead ENABLE TRIGGER ALL;


CREATE OR REPLACE FUNCTION public.geteffectivextuser()
 RETURNS text
 LANGUAGE plpgsql
 STABLE
AS $function$
-- Copyright (c) 1999-2012 by OpenMFG LLC, d/b/a xTuple.
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
$function$ ;
