drop view if exists xm.distribution;
drop view if exists xm.distributioninfo;
drop view if exists xm.bill_of_material;
drop view if exists xm.bill_of_material_item;
drop view if exists xt.bomiteminfo;
drop view if exists xm.routing_operation;
drop view if exists xt.share_users_shipto_cust;
drop view if exists xt.crmacct_users;

drop view if exists xm.planner_code;
drop view if exists xm.inventory_availability;
drop view if exists xm.invavail;
drop view if exists xm.shipment;
drop view if exists xm.ship_shipment;
drop view if exists xm.purchase_order;
drop view if exists xm.receipt;
drop view if exists xm.sales_order;
drop view if exists xm.shipment_line;
drop view if exists xm.ship_shipment_line;
drop view if exists xm.purchase_order_line;
drop view if exists xm.sales_order_line;
drop view if exists xm.account;
drop view if exists xm.contact;
drop view if exists xm.customer;
drop view if exists xm.incident;
drop view if exists xm.inventory_history;
drop view if exists xm.issue_to_shipping;
drop view if exists xm.item;
drop view if exists xm.location;
drop view if exists xm.opportunity;
drop view if exists xm.project;
drop view if exists xm.purchase_order_list_item;
drop view if exists xm.purchase_order_relation;
drop view if exists xm.quote;
drop view if exists xm.sales_history;
drop view if exists xm.sales_order_line_list_item;
drop view if exists xm.to_do;
drop view if exists xm.work_order_list_item;
drop view if exists xm.account_item;
drop view if exists xm.contact_item;
drop view if exists xm.customer_item;
drop view if exists xm.incident_item;
drop view if exists xm.item_item;
drop view if exists xm.item_site;
drop view if exists xm.item_site_inventory;
drop view if exists xm.item_site_list_item;
drop view if exists xm.item_site_relation;
drop view if exists xm.location_item;
drop view if exists xm.opportunity_item;
drop view if exists xm.project_item;
drop view if exists xm.quote_item;
drop view if exists xm.quote_line;
drop view if exists xm.sales_order_item;
drop view if exists xm.to_do_item;
drop view if exists xm.vendor;
drop view if exists xm.vendor_relation;
drop view if exists xm.account_list_item;
drop view if exists xm.address;
drop view if exists xm.contact_list_item;
drop view if exists xm.employee;
drop view if exists xm.incident_list_item;
drop view if exists xm.item_list_item;
drop view if exists xm.item_relation;
drop view if exists xm.opportunity_list_item;
drop view if exists xm.account_characteristic;
drop view if exists xm.account_list_item_characteristic;
drop view if exists xm.address_characteristic;
drop view if exists xm.contact_characteristic;
drop view if exists xm.contact_list_item_characteristic;
drop view if exists xm.customer_characteristic;
drop view if exists xm.employee_characteristic;
drop view if exists xm.incident_characteristic;
drop view if exists xm.incident_list_item_characteristic;
drop view if exists xm.item_characteristic;
drop view if exists xm.item_list_item_characteristic;
drop view if exists xm.item_relation_characteristic;
drop view if exists xm.opportunity_characteristic;
drop view if exists xm.opportunity_list_item_characteristic;
drop view if exists xm.quote_line_characteristic;
drop view if exists xm.sales_order_line_characteristic;
alter table charass no inherit xt.obj;
alter table charass drop column obj_uuid;
alter table bi_open.usrbichart drop column obj_uuid;


-- cleanup alarm
drop view if exists xm.project_task;
drop view if exists xm.incident_alarm;
drop view if exists xm.project_task_alarm;
drop view if exists xm.to_do_alarm;
alter table alarm no inherit xt.obj;
alter table alarm drop column obj_uuid;



--cleanup ccard
drop view if exists sys.sales_order_payment;
drop view if exists sys.credit_card_payment;
drop view if exists xm.sales_customer;
drop view if exists sys.credit_card;
drop view if exists xm.credit_card;
alter table ccard no inherit xt.obj;
alter table ccard drop column obj_uuid;


--cleanup charopt
drop view if exists xm.characteristic;
drop view if exists xm.characteristic_option;
alter table charopt no inherit xt.obj;
alter table charopt drop column obj_uuid;

--cleanup charopt
drop view if exists xm.characteristic;
drop view if exists xm.characteristic_option;
alter table charopt no inherit xt.obj;
alter table charopt drop column obj_uuid;

alter table itemsrc no inherit xt.obj;
alter table itemsrc drop column obj_uuid;

alter table itemsrcp no inherit xt.obj;
alter table itemsrcp drop column obj_uuid;

alter table invcheadtax no inherit xt.obj;
alter table invcheadtax drop column obj_uuid;

alter table aropentax no inherit xt.obj;
alter table aropentax drop column obj_uuid;

alter table aropenalloc no inherit xt.obj;
alter table aropenalloc drop column obj_uuid;

alter table itemgrp no inherit xt.obj;
alter table itemgrp drop column obj_uuid;

drop table xt.prjwf;
drop table if exists xt.wf;

alter table cntct drop column obj_uuid;
alter table vendinfo drop column obj_uuid;
alter table aropen drop column obj_uuid;
alter table custinfo drop column obj_uuid;
alter table cmhead drop column obj_uuid;
drop view if exists creditmemoitem;
alter table cmitem drop column obj_uuid;
alter table invchead drop column obj_uuid;
alter table prj drop column obj_uuid;
drop view if exists invoiceitem;
alter table invcitem drop column obj_uuid;
alter table ophead drop column obj_uuid;
drop view if exists address;
alter table addr drop column obj_uuid;
alter table cashrcptitem drop column obj_uuid;
alter table emp drop column obj_uuid;
alter table shiphead drop column obj_uuid;
alter table womatl drop column obj_uuid;
alter table vendaddrinfo drop column obj_uuid;
drop view if exists saleshistory;
drop view if exists saleshistorymisc;
alter table cohist drop column obj_uuid;
alter table arapply drop column obj_uuid;
alter table ccpay drop column obj_uuid;
alter table cmheadtax drop column obj_uuid;
alter table cmitemtax drop column obj_uuid;
alter table wo drop column obj_uuid;
alter table empgrp drop column obj_uuid;
alter table invcitemtax drop column obj_uuid;
alter table pr drop column obj_uuid;


drop function if exists xt.show_search_path();
drop function if exists xt.bomitem_did_change();
drop function if exists xt.booitem_did_change();
drop function if exists xt.coitem_order_id_did_change();
drop function if exists xt.co_schedule_date();
drop function if exists xt.invhist_quantity();
drop function if exists xt.po_schedule_date();
drop function if exists xt.record_did_change();
drop function if exists xt.recv_item_did_change();
drop function if exists xt.ship_head_did_change();
drop function if exists xt.ship_item_did_change();
drop function if exists xt.shipment_value();
drop function if exists xt.to_freight_weight();
drop function if exists xt.to_line_at_shipping();
drop function if exists xt.to_line_ship_balance();
drop function if exists xt.to_schedule_date();
drop function if exists xt.to_subtotal();
drop function if exists xt.to_tax_total();
drop function if exists xt.to_total();
drop function if exists xt.womatl_did_change();
drop function if exists xt.womatl_explode_phantom();
drop function if exists xt.womatl_posted_value();
drop function if exists xt.wooper_posted_value();
drop function if exists xt.wo_wf_did_change();


drop view if exists xt.activeorder;
drop view if exists xt.bomiteminfo;
drop view if exists xt.booiteminfo;
drop view if exists xt.brddistinfo;
drop view if exists xt.crmacct_users;
drop view if exists xt.distributioninfo;
drop view if exists xt.invavail;
drop view if exists xt.ordhead;
drop view if exists xt.planordinfo;
drop view if exists xt.prinfo;
drop view if exists xt.prparent;
drop view if exists xt.share_users_shiphead;
drop view if exists xt.shipmentdetail;
drop view if exists xt.toheadinfo;
drop view if exists xt.toiteminfo;
drop view if exists xt.woinfo;
drop view if exists xt.womatlinfo;
drop view if exists xt.womatlissue;
drop view if exists xt.woparent;



drop table if exists xt.emlprofile;
drop table if exists xt.invcharext;
drop table if exists xt.siteemlprofile;
drop table if exists xt.obj;
drop table if exists xt.wfsrc;
drop table if exists xt.sitetypewf;
drop table if exists xt.sitetypeext;
drop table if exists xt.wf;
drop table if exists xt.towf;
drop table if exists xt.wowf;
drop table if exists xt.plancodewf;
drop table if exists xt.woemlprofile;
drop table if exists xt.plancodeext;
drop table if exists xt.wordtype;
drop function if exists xt.coitem_order_id_did_change();
drop function if exists xt.invhist_quantity();
drop function if exists xt.record_did_change();
drop function if exists xt.ship_head_did_change();
drop function if exists xt.ship_item_did_change();
drop function if exists xt.shipment_value();
drop function if exists xt.to_freight_weight();
drop function if exists xt.to_line_at_shipping();
drop function if exists xt.to_line_ship_balance();
drop function if exists xt.to_schedule_date();
drop trigger planord_did_change on planord;
drop trigger urlinfo_did_change on urlinfo;
drop trigger recv_item_did_change on recv;
drop trigger pr_did_change on pr;
drop trigger wo_did_change on wo;
drop trigger lbrrate_did_change on xtmfg.lbrrate;
drop trigger stdopn_did_change on table xtmfg.stdopn;
drop trigger wrkcnt_did_change on table xtmfg.wrkcnt;
drop function xt.shipment_value(integer);
drop function xt.to_freight_weight(tohead);
drop function xt.to_line_at_shipping(toitem);
drop function xt.to_line_ship_balance(toitem);
drop function xt.to_schedule_date(tohead);
drop function xt.to_subtotal(tohead);
drop function xt.to_tax_total(tohead);
drop function xt.to_total(tohead);
drop function xt.wo_wf_did_change();
drop trigger wo_wf_did_change on wo;
drop function xt.womatl_did_change();
drop trigger womatl_did_change on womatl;
drop function xt.womatl_explode_phantom(integer);
drop function xt.womatl_posted_value(integer);
drop function xt.wooper_posted_value(integer);

drop trigger teitem_did_change on te.teitem;
drop trigger tehead_did_change on te.tehead;
drop trigger itemgrp_did_change on itemgrp;
drop function xt.recv_item_did_change();
drop function xt.invhist_quantity(integer);
drop function xt.record_did_change();
drop trigger stdopn_did_change on xtmfg.stdopn;
drop trigger wrkcnt_did_change on xtmfg.wrkcnt;

drop trigger ship_head_did_change on shiphead;
drop function if exists xt.ship_head_did_change();
drop trigger coitem_order_id_did_change on coitem;
drop function if exists xt.coitem_order_id_did_change();
drop trigger bomhead_did_change on bomhead;
drop trigger boohead_did_change on xtmfg.boohead;
drop trigger cashrcpt_did_change on cashrcpt;
drop trigger ship_item_did_change on shipitem;
drop function xt.ship_item_did_change();
drop table if exists xt.recvext;
drop table if exists xt.pordtype;

drop trigger if exists itemsrc_did_change on itemsrc;
drop trigger if exists coitem_order_if_did_change on coitem;
drop table if exists xt.emlprofile;
drop table if exists xt.custemlprofile;
drop table if exists xt.ext;
drop table if exists xt.rptdef;
drop table if exists xt.prjext;
drop table if exists xt.prjtaskext;
drop table if exists xt.obj_share;
drop table if exists xt.custcustemlprofile;
drop table if exists xt.extdep;
drop table if exists xt.localeext;
drop table if exists xt.wfsrc;
drop table if exists xt.saletypewf;
drop table if exists xt.salesemlprofile;
drop table if exists xt.saletypeext;
drop table if exists xt.prjemlprofile;
drop table if exists xt.tskresource;
drop table if exists xt.prjtypewf;
drop table if exists xt.prjtypeext;
drop table if exists xt.poemlprofile;
drop table if exists xt.dict;
drop table if exists xt.obj_type;
drop table if exists xt.wftype;


--cleanup cmnttypesource
drop view if exists xm.quote_customer;
drop view if exists xm.quote_list_item;
drop view if exists xm.sales_order_customer;
drop view if exists xm.customer_prospect_relation;
drop view if exists xm.site;
drop view if exists xm.task;
drop view if exists xm.account_comment;
drop view if exists xm.address_comment;
drop view if exists xm.contact_comment;
drop view if exists xm.customer_comment;
drop view if exists xm.employee_comment;
drop view if exists xm.incident_comment;
drop view if exists xm.item_comment;
drop view if exists xm.item_site_comment;
drop view if exists xm.opportunity_comment;
drop view if exists xm.project_comment;
drop view if exists xm.project_task_comment;
drop view if exists xm.quote_comment;
drop view if exists xm.quote_line_comment;
drop view if exists xm.sales_order_comment;
drop view if exists xm.sales_order_line_comment;
drop view if exists xm.site_comment;
drop view if exists xm.task_comment;
drop view if exists xm.to_do_comment;
drop view if exists xm.comment_type;
drop view if exists xm.comment_type_source;
alter table cmnttypesource no inherit xt.obj;
alter table cmnttypesource drop column obj_uuid;
alter table bomitem drop column obj_uuid;
alter table xtmfg.booitem drop column obj_uuid;
alter table bomhead drop column obj_uuid;
alter table planord drop column obj_uuid;
alter table bi.usrbichart drop column obj_uuid;
alter table planreq drop column obj_uuid;
alter table rev drop column obj_uuid;
alter table womatlpost drop column obj_uuid;
alter table xtmfg.boohead drop column obj_uuid;
alter table xtmfg.wooper drop column obj_uuid;
alter table xtmfg.wotc drop column obj_uuid;
alter table xtmfg.brddist drop column obj_uuid;
alter table xtmfg.wooperpost drop column obj_uuid;


--cleanup cntcteml
drop view if exists xm.contact_info;
drop view if exists xm.contact_email;
alter table cntcteml no inherit xt.obj;
alter table cntcteml drop column obj_uuid;



drop view if exists xm.customer_group;
drop view if exists xm.customer_group_customer;
alter table custgrpitem no inherit xt.obj;
alter table custgrpitem drop column obj_uuid;



drop view if exists xm.item_group;
drop view if exists xm.item_group_item;
alter table itemgrpitem no inherit xt.obj;
alter table itemgrpitem drop column obj_uuid;



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
drop view if exists xm.invoice;
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
drop view if exists xm.sales_order_relation;
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

alter table cohead no inherit xt.obj;
alter table cohead drop column if exists obj_uuid;


--cleanup cohist;
drop view xt.cohistinfo;
alter table cohist no inherit xt.obj;
alter table cohist drop column obj_uuid;

--cleanup coitem;
drop view if exists xtstd.shipmentline;
drop view if exists xt.shipmentline;
drop view if exists xt.coitemship;
drop view if exists xt.enter_receipt;
drop view if exists xt.orditemreceipt;
drop view if exists xt.orditemship;
drop view if exists xt.orditem;

drop view if exists xt.coiteminfo;
alter table coitem no inherit xt.obj;
alter table coitem drop column obj_uuid;

--cleanup comment
drop view xt.crmacctcomment;
alter table comment no inherit xt.obj;
alter table comment drop column obj_uuid;

--cleanup curr_rate
drop view xm.currency_rate;
alter table curr_rate no inherit xt.obj;
alter table curr_rate drop column obj_uuid;

--cleanup te.teitem
drop view if exists xt.teiteminfo;
alter table te.teitem no inherit xt.obj;
alter table te.teitem drop column obj_uuid;

--cleanup docass;
drop view if exists xm.account_account;
drop view if exists xm.account_contact;
drop view if exists xm.account_customer;
drop view if exists xm.account_file;
drop view if exists xm.account_incident;
drop view if exists xm.account_opportunity;
drop view if exists xm.account_project;
drop view if exists xm.account_to_do;
drop view if exists xm.account_url;
drop view if exists xm.contact_account;
drop view if exists xm.contact_contact;
drop view if exists xm.contact_customer;
drop view if exists xm.contact_file;
drop view if exists xm.contact_incident;
drop view if exists xm.contact_opportunity;
drop view if exists xm.contact_project;
drop view if exists xm.contact_to_do;
drop view if exists xm.contact_url;
drop view if exists xm.customer_account;
drop view if exists xm.customer_contact;
drop view if exists xm.customer_customer;
drop view if exists xm.customer_file;
drop view if exists xm.customer_project;
drop view if exists xm.customer_url;
drop view if exists xm.incident_account;
drop view if exists xm.incident_contact;
drop view if exists xm.incident_customer;
drop view if exists xm.incident_file;
drop view if exists xm.incident_incident;
drop view if exists xm.incident_opportunity;
drop view if exists xm.incident_project;
drop view if exists xm.incident_to_do;
drop view if exists xm.incident_url;
drop view if exists xm.item_account;
drop view if exists xm.item_contact;
drop view if exists xm.item_customer;
drop view if exists xm.item_file;
drop view if exists xm.item_url;
drop view if exists xm.opportunity_account;
drop view if exists xm.opportunity_contact;
drop view if exists xm.opportunity_customer;
drop view if exists xm.opportunity_file;
drop view if exists xm.opportunity_incident;
drop view if exists xm.opportunity_opportunity;
drop view if exists xm.opportunity_project;
drop view if exists xm.opportunity_to_do;
drop view if exists xm.opportunity_url;
drop view if exists xm.project_account;
drop view if exists xm.project_contact;
drop view if exists xm.project_customer;
drop view if exists xm.project_file;
drop view if exists xm.project_incident;
drop view if exists xm.project_opportunity;
drop view if exists xm.project_project;
drop view if exists xm.project_to_do;
drop view if exists xm.project_url;
drop view if exists xm.quote_account;
drop view if exists xm.quote_contact;
drop view if exists xm.quote_file;
drop view if exists xm.quote_incident;
drop view if exists xm.quote_opportunity;
drop view if exists xm.quote_project;
drop view if exists xm.quote_to_do;
drop view if exists xm.quote_url;
drop view if exists xm.sales_order_account;
drop view if exists xm.sales_order_contact;
drop view if exists xm.sales_order_file;
drop view if exists xm.sales_order_url;
drop view if exists xm.to_do_account;
drop view if exists xm.to_do_contact;
drop view if exists xm.to_do_customer;
drop view if exists xm.to_do_file;
drop view if exists xm.to_do_incident;
drop view if exists xm.to_do_opportunity;
drop view if exists xm.to_do_project;
drop view if exists xm.to_do_to_do;
drop view if exists xm.to_do_url;
drop view if exists xt.cust_doc;
drop view if exists xt.doc; 

alter table docass no inherit xt.obj;
alter table docass drop column obj_uuid;


--cleanup empgrp;
drop view if exists xm.employee_group_group;
drop view if exists xm.employee_group;
drop view if exists xm.employee_group_employee;
alter table empgrpitem no inherit xt.obj;
alter table empgrpitem drop column obj_uuid;

--cleanup file;
drop view if exists xm.file;
drop view if exists xm.file_relation;
alter table file no inherit xt.obj;
alter table file drop column obj_uuid;

--cleanup grp;
drop view if exists sys."user";
drop view if exists xm.user_account;
drop view if exists sys.user_account_user_account_role_assignment;
drop view if exists xm.user_account_user_account_role_assignment;
drop view if exists sys.user_account_role;
drop view if exists xm.user_account_role;
drop view if exists xm.user_account_role_relation;

alter table grp no inherit xt.obj;
alter table grp drop column obj_uuid;

--cleanup grppriv

drop view if exists xm.user_account_role_privilege_assignment;
drop view if exists sys.user_account_role_privilege_assignment;
alter table grppriv no inherit xt.obj;
alter table grppriv drop column obj_uuid;

--cleanup incdt

drop view if exists xm.customer_incident_relation;
drop view if exists xm.customer_to_do_relation;
drop view if exists xm.incident_relation;
drop view if exists xm.to_do_list_item;
drop view if exists xm.to_do_relation;
drop view if exists xt.incdtinfo;
drop view if exists xt.incdtxt;
drop view if exists xt.todoiteminfo;


alter table incdt no inherit xt.obj;
alter table incdt drop column obj_uuid;


--cleanup incdthist
drop view if exists xm.incident_history;
alter table incdthist no inherit xt.obj;
alter table incdthist drop column obj_uuid;

--cleanup invdetail
drop view if exists xm.inventory_detail;
alter table invdetail no inherit xt.obj;
alter table invdetail drop column obj_uuid;

--cleanup invhist
alter table invhist no inherit xt.obj;
alter table invhist drop column obj_uuid;

--cleanup itemalias 
drop view xm.item_alias;
alter table itemalias no inherit xt.obj;
alter table itemalias drop column obj_uuid;

--cleanup itemloc
drop view xm.item_site_detail;
drop view xt.itemsitedtl;
alter table itemloc no inherit xt.obj;
alter table itemloc drop column obj_uuid;

--cleanup itemsite
drop view if exists xm.item_item_site_relation;
drop view if exists xt.itemsiteinfo;
alter table itemsite no inherit xt.obj;
alter table itemsite drop column obj_uuid;


--cleanup location

drop view xm.item_site_location;
drop view xm.location_relation;
alter table location no inherit xt.obj;
alter table location drop column obj_uuid;

--cleanup locitem;
drop view xt.locitemsite;
alter table locitem no inherit xt.obj;
alter table locitem drop column obj_uuid;

--cleanup payco;
alter table payco no inherit xt.obj;
alter table payco drop column obj_uuid;

--cleanup pohead
drop view if exists xm.purchase_order_workflow;
drop view if exists xt.poheadinfo;
drop view if exists xm.purchase_order_workflow;
drop table xt.powf;
alter table pohead no inherit xt.obj;
alter table pohead drop column obj_uuid;

--cleanup poitem
alter table poitem no inherit xt.obj;
alter table poitem drop column obj_uuid;

--cleanup prjtask
drop view xm.task_list_item;
drop view xm.task_relation;
drop view xm.project_relation;
drop view xm.project_task_relation;
alter table prjtask no inherit xt.obj;
alter table prjtask drop column obj_uuid;


--cleanup quitem
drop view if exists xt.quiteminfo;
drop function xt.quote_line_base_price(quitem);
drop function xt.quote_line_customer_discount(quitem);
drop function xt.quote_line_extended_price(quitem);
drop function xt.quote_line_list_price_discount(quitem);
drop function xt.quote_line_list_price(quitem);
drop function xt.quote_line_margin(quitem);
drop function xt.quote_line_markup(quitem);
drop function xt.quote_line_tax(quitem);

alter table quitem no inherit xt.obj;
alter table quitem drop column obj_uuid;

--cleanup recur
drop view if exists xm.incident_recurrence;
drop view if exists xm.project_recurrence;
drop view if exists xm.to_do_recurrence;
alter table recur no inherit xt.obj;
alter table recur drop column obj_uuid;

--cleanup recv
alter table recv no inherit xt.obj;
alter table recv drop column obj_uuid;

--cleanup shiptoinfo
drop view if exists xm.customer_group;
drop view if exists xm.customer_relation;
drop view if exists xm.customer_group_customer;
drop view if exists xm.customer_relation;
drop view if exists xm.customer_list_item;
drop view if exists xm.customer_relation;
drop view if exists xm.customer_list_item;
drop view if exists xm.customer_shipto_relation;
drop view if exists xm.customer_shipto;

alter table shiptoinfo no inherit xt.obj;
alter table shiptoinfo drop column obj_uuid;

--cleanup taxass
drop view if exists xm.tax_assignment;
alter table taxass no inherit xt.obj;
alter table taxass drop column obj_uuid;

--cleanup taxrate
drop view xm.tax_rate;
alter table taxrate no inherit xt.obj;
alter table taxrate drop column obj_uuid;

--cleanup taxreg
drop view xm.customer_tax_registration;
alter table taxreg no inherit xt.obj;
alter table taxreg drop column obj_uuid;

--cleanup todoitem

alter table todoitem no inherit xt.obj;
alter table todoitem drop column obj_uuid;

--cleanup tohead;

alter table tohead no inherit xt.obj;
alter table tohead drop column obj_uuid;

--cleanup toitem

alter table toitem no inherit xt.obj;
alter table toitem drop column obj_uuid;

--cleanup ls

alter table ls no inherit xt.obj;
alter table ls drop column obj_uuid;

--cleanup prjtask
drop view if exists xt.prjtaskinfo;
alter table prjtask no inherit xt.obj;
alter table prjtask drop column obj_uuid;

--cleanup urlinfo
drop view if exists xm.url;
alter table urlinfo no inherit xt.obj;
alter table urlinfo drop column obj_uuid;
drop function xt.add_priv(text,text,text,text,text,text,boolean);
drop function xt.grp_did_change();
drop table xt.bak_userpriv;
drop function if exists xt.grppriv_did_change();
drop function if exists xt.quote_line_extended_price(integer);
drop function if exists xt.quote_line_list_cost_markup(quitem);
drop function if exists xt.quote_line_tax(integer);
drop function if exists xt.quote_subtotal(integer);
drop function if exists xt.quote_tax_total(integer);
drop function if exists xt.quote_total(integer);
drop function if exists xt.useracct_did_change();
drop function if exists xt.usrgrp_did_change();
drop function if exists xt.usrpriv_did_change();
drop sequence if exists xt.priv_priv_id_seq;
drop sequence if exists xt.useracct_useracct_id_seq;



--cleanup usrgrp
alter table usrgrp no inherit xt.obj;
alter table usrgrp drop column obj_uuid;
drop view if exists xm.user_account_privilege_assignment;
alter table usrpriv no inherit xt.obj;
alter table usrpriv drop column obj_uuid;
drop view if exists xm.user_account_relation;
drop view if exists xm.contact_relation;
drop view if exists xm.sales_rep;
drop view if exists xm.ship_charge;
drop view if exists xm.ship_zone;
drop view if exists xm.tax_zone;
drop view if exists xm.customer_shipto;
drop view if exists xm.customer_relation;
drop view if exists xm.characteristic_option;
drop view if exists xm.characteristic;
drop view if exists xm.source;
drop view if exists xm.comment_type_source;
drop view if exists xm.comment_type;
drop view if exists xm.incident_relation;
drop view if exists xm.class_code;
drop view if exists xm.freight_class;
drop view if exists xm.item_relation_alias;
drop view if exists xm.item_relation_characteristic;
drop view if exists xm.unit;
drop view if exists xm.item_relation;
drop view if exists xm.opportunity_stage;
drop view if exists xm.opportunity_relation;
drop view if exists xm.project_relation;
drop view if exists xm.priority;
drop view if exists xm.to_do_relation;
drop view if exists xm.site_relation;
drop view if exists xm.currency;
drop view if exists xm.bank_account_relation;
drop view if exists xm.customer_group_customer;
drop view if exists xm.customer_group;
drop view if exists xm.customer_customer_group;
drop view if exists xm.customer_email_profile;
drop view if exists xm.customer_type;
drop view if exists xm.terms;
drop view if exists xm.billing_customer;
drop view if exists xm.cash_receipt_line_pending;
drop view if exists xm.receivable_relation;
drop view if exists xm.cash_receipt_receivable;
drop view if exists xm.cash_receipt_line_list_item;
drop view if exists xm.credit_card;
drop view if exists xm.sales_customer;
drop view if exists xm.reason_code;
drop view if exists xm.receivable_application;
drop view if exists xm.return_allocation;
drop view if exists xm.tax_authority;
drop view if exists xm.tax_class;
drop view if exists xm.tax_code;
drop view if exists xm.return_tax;
drop view if exists xm.tax_type;
drop view if exists xm.receivable_tax;
drop view if exists xm.return_line_tax;
drop view if exists xm.return_line;
drop view if exiexists xm.project_type_workflow;
drop view if exists xm.project_type;
drop view if exists xm.project_workflow;
drop view if exists xm.project_list_item_characteristic;
drop view if exists xm.project_workflow_relation;
drop view if exists xm.purchase_email_profile;
drop view if exists xm.purchase_order_characteristic;
drop view if exists xm.purchase_order_comment;
drop view if exists xm.purchase_order_line_characteristic;
drop view if exists xm.purchase_order_line_comment;
drop view if exists xm.purchase_type_characteristic;
drop view if exists xm.purchase_type_workflow;
drop view if exists xm.purchase_type;
drop view if exists xm.vendor_address_relation;
drop view if exists xm.purchase_vendor_relation;
drop view if exists xm.purchase_order_list_item_characteristic;
drop view if exists xm.purchase_vendor_address;
drop view if exists xm.sales_order_characteristic;
drop view if exists xm.sales_order_incident;
drop view if exists xm.sales_order_opportunity;
drop view if exists xm.sales_order_project;
drop view if exists xm.sales_order_to_do;
drop view if exists xm.task_characteristic;
drop view if exists xm.task_list_item_characteristic;
drop view if exists xm.task_resource_analysis;
drop view if exists xm.user_account_role_list_item;
drop view if exists xm.vendor_address;
drop view if exists xm.vendor_characteristic;
drop view if exists xm.vendor_comment;
drop view if exists xm.vendor_list_item_characteristic;

drop view if exists xm.user_account_relation;
drop view if exists xm.contact_relation;
drop view if exists xm.sales_rep;
drop view if exists xm.ship_charge;
drop view if exists xm.ship_zone;
drop view if exists xm.tax_zone;
drop view if exists xm.customer_shipto;
drop view if exists xm.customer_relation;
drop view if exists xm.prospect_relation;
drop view if exists xm.account_relation;
drop view if exists xm.characteristic_option;
drop view if exists xm.characteristic;
drop view if exists xm.source;
drop view if exists xm.comment_type_source;
drop view if exists xm.comment_type;
drop view if exists xm.file_relation;
drop view if exists xm.incident_relation;
drop view if exists xm.class_code;
drop view if exists xm.freight_class;
drop view if exists xm.item_relation_alias;
drop view if exists xm.item_relation_characteristic;
drop view if exists xm.unit;
drop view if exists xm.item_relation;
drop view if exists xm.opportunity_stage;
drop view if exists xm.opportunity_relation;
drop view if exists xm.project_relation;
drop view if exists xm.priority;
drop view if exists xm.to_do_relation;
drop view if exists xm.url;
drop view if exists xm.site_relation;
drop view if exists xm.agent;
drop view if exists xm.currency;
drop view if exists xm.bank_account;
drop view if exists xm.bank_account_relation;
drop view if exists xm.customer_group_customer;
drop view if exists xm.customer_group;
drop view if exists xm.customer_customer_group;
drop view if exists xm.customer_email_profile;
drop view if exists xm.customer_type;
drop view if exists xm.terms;
drop view if exists xm.billing_customer;
drop view if exists xm.cash_receipt_line_pending;
drop view if exists xm.receivable_relation;
drop view if exists xm.cash_receipt_receivable;
drop view if exists xm.cash_receipt_line_list_item;
drop view if exists xm.credit_card;
drop view if exists xm.sales_customer;
drop view if exists xm.cash_receipt;
drop view if exists xm.reason_code;
drop view if exists xm.receivable_application;
drop view if exists xm.receivable_list_item;
drop view if exists xm.remit_to;
drop view if exists xm.return_allocation;
drop view if exists xm.return_list_item;
drop view if exists xm.return_relation;
drop view if exists xm.cash_receipt_line;
drop view if exists xm.cash_receipt_list_item;
drop view if exists xm.cash_receipt_relation;
drop view if exists xm.credit_card_payment;
drop view if exists xm.tax_authority;
drop view if exists xm.sales_customer_shipto_relation;
drop view if exists xm.extension_dependency;
drop view if exists xm.invoice_account;
drop view if exists xm.invoice_allocation;
drop view if exists xm.invoice_characteristic;
drop view if exists xdrop view if exists xm.invoice_opportunity;
drop view if exists xm.invoice_project;
drop view if exists xm.invoice_relation;
drop view if exists xm.invoice_tax;
drop view if exists xm.invoice_url;
drop view if exists xm.sale_type_characteristic;
drop view if exists xm.sale_type_workflow;
drop view if exists xm.sales_email_profile;
drop view if exists xm.sale_type;
drop view if exists xm.return;
drop view if exists xm.item_group_relation;
drop view if exists xm.item_source_price;
drop view if exists xm.vendor_relation;
drop view if exists xm.item_source;
drop view if exists xm.item_source_manufacturer;
drop view if exists xm.project_characteristic;
drop view if exists xm.project_email_profile;
drop view if exists xt.aropeninfo;
drop view if exists xt.cashrcptitem_pending;
drop view if exists xt.cmheadtaxinfo;
drop view if exists xt.cmiteminfo;
drop view if exists xt.cmitemtaxinfo;
drop view if exists xt.crmacctaddr;
drop view if exists xt.crmacct_users;
drop view if exists xt.custitem;
drop view if exists xt.invcheadinfo;
drop view if exists xt.invciteminfo;
drop view if exists xt.invcitemtaxinfo;
drop view if exists xt.itemsrcmfg;
drop view if exists xt.obj_uuid;
drop view if exists xt.poiteminfo;
drop view if exists xt.receivable_applications;
drop view if exists xt.receivable_invoice_return;
drop view if exists xt.remittoinfo;
drop view if exists xt.resource;
drop view if exists xt.share_users_addr;
drop view if exists xt.share_users_cntct;
drop view if exists xt.share_users_cust;
drop view if exists xt.share_users_default;
drop view if exists xt.share_users_invchead;
drop view if exists xt.share_users_shipto;
drop view if exists xt.share_users_shipto_addr;
drop view if exists xt.share_users_shipto_cntct;
drop view if exists xt.shiptoitem;
drop view if exists xt.sochild;
drop view if exists xt.tskresourceanalysis;
drop view if exists xt.vendaddrxt; 
drop view if exists sys.customer_email_profile;
drop view if exists sys.file;
drop view if exists sys.privilege;
drop view if exists sys.report_definition;
drop view if exists sys.user_account_privilege_assignment;
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
drop trigger if exists aropen_did_change on aropen;
drop trigger if exists ccpay_did_change on ccpay;
drop trigger if exists cmhead_did_change on cmhead;
drop trigger if exists payco_did_change on payco;
drop trigger if exists pohead_did_change on pohead;
drop trigger if exists rsncode_did_change on rsncode;
drop trigger if exists salescat_did_change on salescat;
drop trigger if exists itemsrc_vendor_item_number_did_change on itemsrc;
drop trigger if exists customer_did_change on custinfo;
drop function xt.customer_did_change();
drop function if exists xt.itemsrc_did_change();
drop function if exists xt.obj_type_did_change();
drop function if exists xt.record_did_change();
drop function if exists xt.register_extension();
drop function if exists xt.sales_order_did_change();
drop function if exists xt.add_comment_type(text,text,text);
drop function if exists xt.create_schema(text);


drop function if exists xt.register_extension_dependency(text,text);
drop function if exists xt.set_dictionary(text,text,text);
drop table if exists xt.sharetype;
drop function if exists xt.sharetype_did_change();
drop table if exists xt.sordtype;
drop function if exists xt.sordtype_did_change();
drop function if exists xt.workflow_notify(uuid);
drop table if exists xt.poheadext;
drop table if exists xt.potypewf;
drop table if exists xt.potype;

drop function if existists xt.!<@(numeric,numeric[]);
drop operator if exists xt.~?(text,text);
drop operator if exists xt.<@(text,text[]);
drop operator if exists xt.<@(numeric,numeric[]);
drop operator if exists xt.~^(text,text);
drop function if exists xt.not_any_numeric(numeric,numeric[]);
drop function if exists xt.any_uuid(uuid,uuid[]);
drop function if exists xt.ar_balance(aropen);
drop function if exists xt.ar_tax_total(integer);
drop function if exists xt.cashrcpt_applied_amount(numeric,boolean);
drop function if exists xt.cashrcpt_balance(numeric,numeric);
drop function if exists xt.cashrcpt_receivable_balance(numeric);
drop function if exists xt.cashrcpt_receivable_sum_amount(numeric,boolean);
drop function if exists xt.cm_balance(integer,numeric,numeric,integer,date,integer,text);
drop function if exists xt.cm_line_tax_total(integer);
drop function if exists xt.cm_subtotal(integer);
drop function if exists xt.cm_tax_total(integer);
drop function if exists xt.cm_total(integer,numeric,numeric);
drop function if exists xt.co_authorized_credit(text);
drop table xt.acttype;
drop function if exists xt.acttype_did_change();
drop function if exists xt.any_uuid(uuid,uuid[]);
drop function if exists xt.ar_balance(aropen);
drop function if exists xt.ar_tax_total(integer);
drop function if exists xt.cust_outstanding_credit(integer,integer,date);
drop function if exists xt.customer_did_change();
drop function if exists xt.acttype_did_change();
drop function if exists xt.ar_balance(aropen);
drop function if exists xt.ar_tax_total(integer);
drop function if exists xt.cust_outstanding_credit(integer,integer,date);
drop function if exists xt.findxt();
drop function if exists xt.grant_role_ext(text,text);
drop function if exists xt.grant_role_priv(text,text,text);
drop function if exists xt.grant_user_role(text,text);
drop function if exists xt.invc_allocated_credit(integer,integer,date);
drop function if exists xt.invc_authorized_credit(text);
drop function if exists xt.invc_line_extended_price(numeric,numeric,numeric,numeric);
drop function if exists xt.invc_outstanding_credit(integer,integer,date);
drop function if exists xt.invc_subtotal(invchead);
drop function if exists xt.invc_tax_total(integer);
drop function if exists xt.invc_total(invchead);
drop function if exists xt.itemsrc_did_change();
drop function if exists xt.obj_type_did_change();
drop function if exists xt.po_freight_subtotal(pohead);
drop function if exists xt.po_line_extended_price(poitem);
drop function if exists xt.po_line_tax(poitem);
drop function if exists xt.po_schedule_date(pohead);
drop function if exists xt.po_subtotal(pohead);
drop function if exists xt.po_tax_total(pohead);
drop function if exists xt.po_total(pohead);
drop function if exists xt.prj_actual_exp(integer);
drop function if exists xt.prj_actual_hrs(integer);
drop function if exists xt.prj_balance_exp(integer);
drop function if exists xt.prj_balance_hrs(integer);
drop function if exists xt.prj_budget_exp(integer);
drop function if exists xt.prj_budget_hrs(integer);
drop function if exists xt.acttype_did_change();
drop function if exists xt.ar_balance(aropen);
drop function if exists xt.ar_tax_total(integer);
drop function if exists xt.cust_outstanding_credit(integer,integer,date);
drop function if exists xt.invc_allocated_credit(integer,integer,date);
drop function if exists xt.invc_authorized_credit(text);
drop function if exists xt.invc_subtotal(invchead);
drop function if exists xt.invc_tax_total(integer);
drop function if exists xt.invc_total(invchead);
drop function if exists xt.itemsrc_did_change();
drop function if exists xt.obj_type_did_change();
drop function if exists xt.po_line_extended_price(poitem);
drop function if exists xt.po_line_tax(poitem);
drop function if exists xt.record_did_change();
drop function if exists xt.register_extension();
drop function if exists xt.sales_order_did_change();


drop trigger if exists whsinfo_did_change on whsinfo;
drop trigger if exists whsezone_did_change on whsezone;
drop trigger if exists uom_did_change on uom;
drop trigger if exists todoitem_did_change on todoitem;
drop trigger if exists terms_did_change on terms;
drop trigger if exists state_did_change on state;
drop trigger if exists sitetype_did_change on sitetype;
drop trigger if exists shipzone_did_change on shipzone;
drop trigger if exists shipvia_did_change on shipvia;
drop trigger if exists shiphead_did_change on shiphead;
drop trigger if exists shipchrg_did_change on shipchrg;
drop trigger if exists shift_did_change on shift;
drop trigger if exists saletype_did_change on saletype;
drop trigger if exists salesrep_did_change on salesrep;
drop trigger if exists recv_did_change on recv;
drop trigger if exists quhead_did_change on quhead;
drop trigger if exists prospect_did_change on prospect;
drop trigger if exists prodcat_did_change on prodcat;
drop trigger if exists prj_did_change on prj;
drop trigger if exists plancode_did_change on plancode;
drop trigger if exists optype_did_change on optype;
drop trigger if exists opstage_did_change on opstage;
drop trigger if exists opsource_did_change on opsource;
drop trigger if exists ophead_did_change on ophead;
drop trigger if exists location_did_change on location;
drop trigger if exists itemsite_did_change on itemsite;
drop trigger if exists item_did_change on item;
drop trigger if exists incdtseverity_did_change on incdtseverity;
drop trigger if exists incdtresolution_did_change on incdtresolution;
drop trigger if exists incdtpriority_did_change on incdtpriority;
drop trigger if exists incdtcat_did_change on incdtcat;
drop trigger if exists incdt_did_change on incdt;
drop trigger if exists hnfc_did_change on hnfc;
drop trigger if exists freightclass_did_change on freightclass;
drop trigger if exists file_did_change on file;
drop trigger if exists expcat_did_change on expcat;
drop trigger if exists empgrp_did_change on empgrp;
drop trigger if exists emp_did_change on emp;
drop trigger if exists dept_did_change on dept;
drop trigger if exists custtype_did_change on custtype;
drop trigger if exists custinfo_did_change on custinfo;
drop trigger if exists custgrp_did_change on custgrp;
drop trigger if exists curr_symbol_did_change on curr_symbol;
drop trigger if exists crmacct_did_change on crmacct;
drop trigger if exists country_did_change on country;
drop trigger if exists costcat_did_change on costcat;
drop trigger if exists cohead_did_change on cohead;
drop trigger if exists cntct_did_change on cntct;
drop trigger if exists classcode_did_change on classcode;
drop trigger if exists char_did_change on "char";
drop trigger if exists addr_did_change on addr;
drop function if exists xt.mergecrmaccts(integer,boolean);
drop function if exists xt.is_date(text);
drop function if exists xt.install_orm(text);
drop function if exists xt.install_js(text,text,text,text,boolean);
drop function if exists xt.install_guiscript(text,text);
drop function if exists xt.insert_client(text,text,text,text);
drop function if exists xt.getschema(text,text);
drop function if exists xt.get_id(text,text,text,text,text);
drop function if exists xt.get(text);
drop function if exists xt.execute_query(text);
drop operator if exists ~?(text,text);
drop function if exists xt.ends_with(text,text);
drop function if exists xt.delete(text);
drop function if exists xt.decamelize(text);
drop function if exists xt.createuser(text,boolean);
drop function if exists xt.create_view(text,text,boolean);
drop function if exists xt.create_table(text,text,boolean,text);
drop function if exists xt.comment_did_change();
drop function if exists xt.co_total_cost(cohead);
drop function if exists xt.co_total(cohead);
drop function if exists xt.co_tax_total(cohead);
drop function if exists xt.co_subtotal(cohead);
drop function if exists xt.co_schedule_date(cohead);
drop function if exists xt.co_margin(cohead);
drop function if exists xt.mergecrmaccts(integer,boolean);
drop function if exists xt.js_init(boolean);
drop function if exists xt.is_date(text);
drop function if exists xt.install_orm(text);
drop function if exists xt.install_js(text,text,text,text,boolean);
drop function if exists xt.co_line_tax(coitem);
drop function if exists xt.co_line_ship_balance(coitem);
drop function if exists xt.co_line_markup(coitem);
drop function if exists xt.co_line_margin(coitem);
drop function if exists xt.co_line_list_price_discount(coitem);
drop function if exists xt.co_line_list_price(coitem);
drop function if exists xt.co_line_extended_price(coitem);
drop function if exists xt.co_line_customer_discount(coitem);
drop function if exists xt.co_line_base_price(coitem);
drop function if exists xt.co_line_at_shipping(coitem);
drop function if exists xt.co_freight_weight(cohead);
drop function if exists xt.co_allocated_credit(cohead);
drop function if exists xt.cntctrestore(integer);
drop function if exists xt.cntctmerge(integer,integer,boolean);
drop function if exists xt.check_password(text);
drop function if exists xt.change_password(text);
drop operator if exists ~^(text,text);
drop function if exists xt.begins_with(text,text);
drop trigger if exists orm_did_change on xt.orm;
drop view if exists xm.prospect;
drop view if exists xm.quote_relation;
drop view if exists xt.quheadinfo;
drop function if exists xt.record_did_change();
drop function if exists xt.register_extension(text,text,text,text,integer);
drop function if exists xt.raise_exception(text);
drop function if exists xt.quote_total_cost(quhead);
drop function if exists xt.quote_total(quhead);
drop function if exists xt.quote_tax_total(quhead);
drop function if exists xt.quote_subtotal(quhead);
drop function if exists xt.quote_schedule_date(quhead);
drop function if exists xt.quote_margin(quhead);
drop function if exists xt.quote_freight_weight(quhead);
drop table if exists xt.orm;
drop operator if exists !<@(text,text[]);
drop operator if exists <@(text,text[]);
drop operator if exists <@(numeric,numeric[]);
drop operator if exists !<@(numeric,numeric[]);
drop function if exists xt.orm_did_change();
drop function if exists xt.not_any_text(text,text[]);
drop function if exists xt.not_any_numeric(numeric,numeric[]);
drop function if exists xt.any_text(text,text[]);
drop function if exists xt.any_numeric(numeric,numeric[]);
drop function if exists xt.add_priv(text,text,text,text);
drop function if exists xt.add_primary_key(text,text,text);
drop function if exists xt.add_inheritance(text,text);
drop function if exists xt.add_index(text,text,text,text,text);
drop function if exists xt.add_constraint(text,text,text,text);
drop function
drop view if exists xm.incident_category; 
drop view if exists xm.incident_email_profile;
drop view if exists xm.incident_resolution;
drop view if exists xm.incident_severity;
drop view if exists xm.transfer_order;
drop view if exists xm.transfer_order_url;
drop type if exists xm.transfer_order_url;
drop view xm.user_account_extension;
drop view xm.user_account_role_extension;
drop view xm.user_account_extension;
drop view xm.user_account_role_extension;
drop view xm.extension;
drop view if exists xt.orderheadinfo;
drop table if exists xt.lock;
drop table if exists xt.js;
drop table if exists xt.incdtcatemlprofile;
drop table if exists xt.incdtemlprofile;
drop table if exists xt.emlprofile;
drop view if exists xt.customer_prospect;
drop view if exists xt.crmacctaddr;
drop view if exists xt.site;
drop view if exists xt.prjinfo;
drop view if exists xt.opheadinfo;
drop view if exists xt.iteminfo;
drop view xt.usrinfo;
drop table xt.sessionstore;
drop table xt.recover;
drop view if exists xm.oauth2token;
drop table xt.oa2token;
drop view if exists xm.oauth2client;
drop view if exists xm.transfer_order_account;
drop view if exists xm.oauth2client_redirs;
drop table xt.oa2clientredirs;
drop table xt.oa2client;
drop trigger usrpref_did_change on usrpref;
drop function xt.usrpref_did_change();
drop function xt.usr_did_change();
drop function xt.undomerge(text,text,integer);
drop function xt.trylock(integer,integer);
drop operator <(text,date);
drop function xt.text_lt_date(text,date);
drop operator >(text,date);
drop function xt.text_gt_date(text,date);
drop trigger quitem_taxtype_change on quitem;
drop trigger coitem_taxtype_change on coitem;
drop function xt.taxtype_record_did_change();
drop view xt.shipheadinfo;
drop function xt.shipment_value(shiphead);
drop function xt.post(text);
drop function xt.pg_advisory_unlock(integer,integer);
drop function xt.patch(text);
drop function xt.owner_record_did_change();
drop trigger todoitem_owner_change on todoitem;
drop trigger prjtask_owner_change on prjtask;
drop trigger prj_owner_change on prj;
drop trigger ophead_owner_change on ophead;
drop trigger indct_owner_change on incdt;
drop trigger crmacct_owner_change on crmacct;
drop trigger cntct_owner_change on cntct;
drop function xt.generate_uuid();
drop table xt.ver;
drop table xt.incdtemlprofile;
drop table xt.emlprofile;
drop view xt.customer_prospect;
drop table xt.oa2client;
drop table xt.ext;
drop function xt.generate_uuid();
drop view xm.account_relation;
drop view xm.source;
drop view xm.contact_relation;
drop view xm.sales_rep;
drop view xm.tax_zone;
drop view xm.opportunity_stage;
drop view xm.department;
drop view xm.employee_employee_relation;
drop view xm.shift;
drop view xm.site_relation;
drop view xm.tax_authority_relation;
drop view xm.country;
drop view xm.shipment_sales_order;
drop view if exists xm.issue_material;
drop view if exists xm.post_production;
drop view if exists xm.return_material;
drop view if exists xm.enter_receipt;
drop view if exists xm.issue_material;
drop view if exists xm.post_production; 
drop view if exists xm.return_material;
drop view xm.currency;
drop view xm.customer_type;
drop view xm.site_type;
drop view xm.extension;
drop view xm.language;
drop view xm.incident_email_profile;
drop view xm.item_group_item;
drop view xm.tax_class;
drop view xm.user_account_relation;
drop view xm.contact_relation;
drop view xm.address_info;
drop table xt.usrlite;
drop view xt.cntctinfo;
drop view if exists xm.sales_rep;
drop view if exists xm.ship_charge;
drop view if exists xm.ship_zone;
drop view if exists xm.tax_zone;
drop view if exists xm.class_code;
drop view if exists xm.freight_class;
drop view if exists xm.unit;
drop view if exists xm.opportunity_stage;
drop view if exists xm.opportunity_relation;
drop view if exists xm.priority;
drop view if exists xm.department;
drop view if exists xm.employee_employee_relation;
drop view if exists xm.shift;
drop view if exists xm.site_relation;
drop view if exists xm.employee_relation;
drop view if exists xm.prospect_relation;
drop view if exists xm.tax_authorirop view if exists xm.user_chart;
drop view if exists xm.expense_category;
drop view if exists xm.filter;
drop view if exists xm.honorific;
drop view if exists xm.incident_email_profile;
drop view if exists xm.incident_category;
drop view if exists xm.incident_resolution;
drop view if exists xm.incident_severity;
drop view if exists xm.planner_code;
drop view if exists xm.shipment_sales_order;
drop view if exists xm.shipment_relation;
drop view if exists xm.product_category;
drop view if exists xm.item_group_item;
drop view if exists xm.item_group;
drop view if exists xm.ledger_account;
drop view if exists xm.ledger_account_relation;
drop view if exists xm.site_zone_relation;
drop view if exists xm.opportunity_source;
drop view if exists xm.opportunity_type;
drop view if exists xm.project_list_item;
drop view if exists xm.vendor_type;
drop view if exists xm.tax_type;
drop view if exists xm.sale_type;
drop view if exists xm.ship_via;
drop view if exists xm.shipment_list_item;
drop view if exists xm.site_list_item;
drop view if exists xm.state;
drop view if exists xm.task_project_relation;
drop view if exists xm.tax_class;
drop view if exists xm.tax_code;
drop view if exists xm.account_relation;
drop view if exists xm.address_info;
drop view if exists xm.bill_of_material_item_relation;
drop view if exists xm.bill_of_material_revision;
drop view if exists xm.characteristic;
drop view if exists xm.characteristic_option;
drop view if exists xm.class_code;
drop view if exists xm.comment_type;
drop view if exists xm.comment_type_source;
drop view if exists xm.contact_relation;
drop view if exists xm.cost_category;
drop view if exists xm.currency;
drop view if exists xm.customer_relation;
drop view if exists xm.customer_shipto;
drop view if exists xm.department;
drop view if exists xm.employee_employee_relation;
drop view if exists xm.employee_relation;
drop view if exists xm.expense_category;
drop view if exists xm.file_relation;
drop view if exists xm.freight_class;
drop view if exists xm.inventory_detail;
drop view if exists xm.inventory_history;
drop view if exists xm.item_relation;
drop view if exists xm.item_relation_alias;
drop view if exists xm.item_relation_characteristic;
drop view if exists xm.item_site_relation;
drop view if exists xm.item_source;
drop view if exists xm.item_source_price;
drop view if exists xm.item_workbench;
drop view if exists xm.item_workbench_alias;
drop view if exists xm.item_workbench_availability;
drop view if exists xm.item_workbench_comment;
drop view if exists xm.item_workbench_order;
drop view if exists xm.labor_rate;
drop view if exists xm.location;
drop view if exists xm.location_item;
drop view if exists xm.location_relation;
drop view if exists xm.planned_order;
drop view if exists xm.planned_order_list_item;
drop view if exists xm.planned_order_relation;
drop view if exists xm.planner_code;
drop view if exists xm.planner_code_work_order_workflow;
drop view if exists xm.priority;
drop view if exists xm.product_category;
drop view if exists xm.project_relation;
drop view if exists xm.prospect_relation;
drop view if exists xm.purchase_order_line;
drop view if exists xm.purchase_order_line_characteristic;
drop view if exists xm.purchase_order_line_comment;
drop view if exists xm.purchase_request;
drop view if exists xm.purchase_request_list_item;
drop view if exists xm.purchase_request_parent;
drop view if exists xm.routing;
drop view if exists xm.routing_list_item;
drop view if exists xm.routing_operation;
drop view if exists xm.routing_operation_relation;
drop view if exists xm.routing_relation;
drop view if exists xm.routing_revision;
drop view if exists xm.sales_order_line_child;
drop view if exists xm.sales_rep;
drop view if exists xm.shift;
drop view if exists xm.ship_charge;
drop view if exists xm.ship_via;
drop view if exists xm.ship_zone;
drop view if exists xm.site;
drop view if exists xm.site_comment;
drop view if exists xm.site_email_profile;
drop view if exists xm.site_relation;
drop view if exists xm.site_type;
drop view if exists xm.site_type_characteristic;
drop view if eacteristic;
drop view if exists xm.work_order_material;
drop view if exists xm.work_order_material_posting;
drop view if exists xm.work_order_material_relation;
drop view if exists xm.work_order_operation;
drop view if exists xm.work_order_operation_posting;
drop view if exists xm.work_order_operation_relation;
drop view if exists xm.work_order_parent;
drop view if exists xm.work_order_relation;
drop view if exists xm.work_order_time_clock;
drop view if exists xm.work_order_workflow;
drop function if exists xt.coitem_order_id_did_change();
drop function if exists xt.invhist_quantity();
drop function if exists xt.record_did_change();
drop function if exists xt.ship_head_did_change();
drop function if exists xt.ship_item_did_change();
drop function if exists xt.shipment_value();
drop function if exists xt.to_freight_weight();
drop function if exists xt.to_line_at_shipping();
drop function if exists xt.to_line_ship_balance();
drop function if exists xt.to_schedule_date();

drop table if exists xt.emlprofile;
drop table if exists xt.invcharext;
drop table if exists xt.siteemlprofile;
drop table if exists xt.obj;
drop table if exists xt.wfsrc;
drop table if exists xt.sitetypewf;
drop table if exists xt.sitetypeext;
drop table if exists xt.wf;
drop table if exists xt.towf;
drop table if exists xt.wowf;
drop table if exists xt.plancodewf;
drop table if exists xt.woemlprofile;
drop table if exists xt.plancodeext;
drop table if exists xt.wordtype;
drop table xt.obj;
drop function if exists xt.bomitem_did_change();
drop function if exists xt.booitem_did_change();
drop function if exists xt.coitem_order_id_did_change();
drop function if exists xt.co_schedule_date();
drop function if exists xt.invhist_quantity();
drop function if exists xt.po_schedule_date();
drop function if exists xt.record_did_change();
drop function if exists xt.recv_item_did_change();
drop function if exists xt.ship_head_did_change();
drop function if exists xt.ship_item_did_change();
drop function if exists xt.shipment_value();
drop function if exists xt.to_freight_weight();
drop function if exists xt.to_line_at_shipping();
drop function if exists xt.to_line_ship_balance();
drop function if exists xt.to_schedule_date();
drop function if exists xt.to_subtotal();
drop function if exists xt.to_tax_total();
drop function if exists xt.to_total();
drop function if exists xt.womatl_did_change();
drop function if exists xt.womatl_explode_phantom();
drop function if exists xt.womatl_posted_value();
drop function if exists xt.wooper_posted_value();
drop function if exists xt.wo_wf_did_change();
drop view if exists xt.activeorder;
drop view if exists xt.bomiteminfo;
drop view if exists xt.booiteminfo;
drop view if exists xt.brddistinfo;
drop view if exists xt.crmacct_users;
drop view if exists xt.distributioninfo;
drop view if exists xt.invavail;
drop view if exists xt.ordhead;
drop view if exists xt.planordinfo;
drop view if exists xt.prinfo;
drop view if exists xt.prparent;
drop view if exists xt.share_users_shiphead;
drop view if exists xt.shipmentdetail;
drop view if exists xt.toheadinfo;
drop view if exists xt.toiteminfo;
drop view if exists xt.woinfo;
drop view if exists xt.womatlinfo;
drop view if exists xt.womatlissue;
drop view if exists xt.woparent;
drop function xt.owner_record_did_change();
drop function xt.shipment_value(shiphead);
drop table xt.clientcode;
drop table xt.ext;
drop table xt.oa2clientredirs;
drop table xt.oa2client;
drop table xt.grpext;
drop table xt.usrext;
drop table xt.usrlite;
drop view xt.cntctinfo;
drop view xt.opheadinfo;
drop view xt.prjinfo;
drop view xt.site;
drop view xt.crmacctaddr;
drop view xt.customer_prospect;
drop table xt.fltr;
drop table xt.emlprofile;
drop table xt.incdtemlprofile;
drop table xt.incdtcatemlprofile;
drop view xt.shipheadinfo;
drop table xt.usrchart;
drop table xt.fltr;
drop table xt.obj;
drop table xt.usrext;
drop table xt.grpext;
drop table xt.clientcode;
drop table xt.usrchart;
drop table xt.grpext;
drop table xt.usrext;
drop table xt.ext;
drop table xt.bicache;
drop view xm.shipment_sales_order;
drop viet_relation;
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
drop function if exists xt.co_line_at_shipping(coitem);
drop function if exists xt.co_line_base_price(coitem);
drop function if exists xt.co_line_customer_discouw xm.document_association;
drop view xm.printer;
drop view xt.crmacct_users;
drop view xt.share_users_cust_cntct;

drop trigger printer_did_change on xt.printer;
drop function xt.createwf_after_insert();
drop trigger prjwf_after_insert on prj;
drop trigger sowf_after_insert on cohead;
drop function xt.grant_user_ext(text,text);
drop function xt.grant_user_priv(text,text,text);
drop function xt.record_did_change();
drop function xt.refresh_addr_share_users_cache();
drop trigger addr_share_users_cache on addr;
drop function xt.refresh_cache_share_users_obj(uuid);
drop function xt.refresh_cache_share_users_user(text);
drop function xt.refresh_cntct_share_users_cache();
drop trigger cntct_share_users_cache on cntct;
drop function xt.refresh_cohead_share_users_cache();
drop trigger cohead_share_users_cache on cohead;
drop function xt.refresh_crmacct_share_users_cache();
drop trigger crmacct_share_users_cache on crmacct;
drop function xt.refresh_custinfo_share_users_cache();
drop trigger custinfo_share_users_cache on custinfo;
drop function xt.refresh_invchead_share_users_cache();
drop trigger invchead_share_users_cache on invchead;
drop function xt.refresh_obj_share_cache();
drop function xt.refresh_share_user_cache();
drop function xt.refresh_shiptoinfo_share_users_cache();
drop trigger shiptoinfo_share_users_cache on shiptoinfo;
drop function xt.workflow_inheritsource(text,text,uuid,integer);
drop table xt.cache_share_users;
drop table xt.printer;
drop function xt.createwf_after_insert();
drop function xt.refresh_addr_share_users_cache();
drop function xt.refresh_cntct_share_users_cache();
drop function xt.refresh_cohead_share_users_cache();
drop function xt.refresh_crmacct_share_users_cache();
drop function xt.refresh_custinfo_share_users_cache();
drop function xt.refresh_invchead_share_users_cache();
drop function xt.refresh_shiptoinfo_share_users_cache(); 
drop view if exists xm.address_info;
drop view if exists xm.user_account_relation;
drop view if exists xm.contact_relation;
drop view if exists xm.sales_rep;
drop view if exists xm.ship_charge;
drop view if exists xm.ship_zone;
drop view if exists xm.tax_zone;
drop view if exists xm.customer_shipto;
drop view if exists xm.customer_relation;
drop view if exists xm.characteristic_option;
drop view if exists xm.characteristic;
drop view if exists xm.class_code;
drop view if exists xm.freight_class;
drop view if exists xm.item_relation_alias;
drop view if exists xm.item_relation_characteristic;
drop view if exists xm.unit;
drop view if exists xm.item_relation;
drop view if exists xm.project_task_relation;
drop view if exists xm.worksheet_project_relation;
drop function if exists xt.uuid_generate_v4();
drop view if exists xm.address_info;
drop view if exists xm.user_account_relation;
drop view if exists xm.contact_relation;
drop view if exists xm.sales_rep;
drop view if exists xm.ship_charge;
drop view if exists xm.ship_zone;
drop view if exists xm.tax_zone;
drop view if exists xm.customer_shipto;
drop view if exists xm.customer_relation;
drop view if exists xm.characteristic_option;
drop view if exists xm.characteristic;
drop view if exists xm.class_code;
drop view if exists xm.freight_class;
drop view if exists xm.item_relation_alias;
drop view if exists xm.item_relation_characteristic;
drop view if exists xm.unit;
drop view if exists xm.item_relation;
drop view if exists xm.project_task_relation;
drop view if exists xm.worksheet_project_relation;
drop function if exists xt.uuid_generate_v4();
drop function id exists xt.any_uuid(uuid,uuid[]);
drop operator xt.<@(uuid,uuid[]);
drop table xt.usrlite;
drop view if exists xm.user_account_relation;
drop view if exists xt.cntctinfo;
drop view if exists xm.contact_relation;
drop view if exists xm.customer_shipto;
drop view if exists xm.customer_relation;
drop view if exists xm.customer_relation;
drop view if exists xm.customer_shipto;
drop table xt.invcharext;
drop view if exists xm.characteristic;
drop view if exists xm.item_relation_characteristic;
drop view if exists xt.teexpinfo;
drop view if exists xm.item_relation;
drop vieprjinfo;
drop view if exists xm.worksheet_project_relation;
drop view if exists xt.cntctinfo                       ;
drop view if exists xt.emlprofile                      ;
drop view if exists xt.emlprofile_emlprofile_id_seq    ;
drop view if exists xt.emlprofile_pkey                 ;
drop view if exists xt.invcharext                      ;
drop view if exists xt.invcharext_pkey                 ;
drop view if exists xt.itemsitedtl                     ;
drop view if exists xt.locationdtl                     ;
drop view if exists xt.obj                             ;
drop view if exists xt.site                            ;
drop view if exists xt.siteemlprofile                  ;
drop view if exists xt.sitetypeext;
drop view if exists xt.sitetypewf;
drop view if exists xt.usrlite;
drop view if exists xt.wfsrc;

drop view if exists xm.address_info                  ;
drop view if exists xm.characteristic                ;
drop view if exists xm.characteristic_option         ;
drop view if exists xm.class_code                    ;
drop view if exists xm.contact_relation              ;
drop view if exists xm.freight_class                 ;
drop view if exists xm.item_relation                 ;
drop view if exists xm.item_relation_alias           ;
drop view if exists xm.item_relation_characteristic  ;
drop view if exists xm.location_inventory_relation   ;
drop view if exists xm.location_relation             ;
drop view if exists xm.location_target_relation      ;
drop view if exists xm.operation_type                ;
drop view if exists xm.priority;
drop view if exists xm.relocate_inventory;
drop view if exists xm.scrap_transaction;
drop view if exists xm.ship_via;
drop view if exists xm.site_email_profile;
drop view if exists xm.site_relation;
drop view if exists xm.site_type;
drop view if exists xm.site_type_characteristic;
drop view if exists xm.site_type_workflow;
drop view if exists xm.tax_zone;
drop view if exists xm.trace_relation;
drop view if exists xm.unit;
drop view if exists xm.user_account_relation;
drop trigger if exists towf_after_insert on tohead;
drop trigger if exists wowf_after_insert on wo;

drop trigger if exists opntype_did_change on xtmfg.opntype;
drop trigger if exists shiphead_share_users_cache on shiphead;
drop function if exists xt.createwf_after_insert();
drop function if exists xt.record_did_change();

drop function if exists xt.refresh_shiphead_share_users_cache();
drop function if exists xt.uuid_generate_v4();

-- new for 4.9.5
alter table cntct drop column obj_uuid;
alter table itemalias drop column obj_uuid;
alter table location drop column obj_uuid;
drop function if exists xt.uuid_generate_v4();
drop function if exists xt.add_priv(text,text,text,text,text) depends;
drop function if exists xt.any_numeric(numeric,numeric[]);
drop operator if exists xtwolotnum.<@(numeric,numeric[]);
drop function if exists xt.any_text(text,text[]);
drop operator if exists xtwolotnum.<@(text,text[]);
drop function if exists xt.any_uuid(uuid,uuid[]);
drop operator if exists xtwolotnum.<@(uuid,uuid[]);
drop function if exists xt.begins_with(text,text);
drop operator if exists xtwolotnum.~^(text,text);
drop function if exists xt.deleteunusedpotypes();
drop function if exists xt.ends_with(text,text);

drop function if exists xt.getoldestlocationid(integer,numeric);
drop function if exists xt.js_init(boolean,boolean);
drop function if exists xt.not_any_numeric(numeric,numeric[]);

drop function if existsn xt.not_any_text(text,text[]);

drop function if exists xt.parseediprofile(text,text);
drop function if exists xt.parsemetasql(text,text);
drop function if exists xt.parsemetasql(text,text,text);
drop function if exists xt.record_did_change();
drop trigger if exists labelform_did_change;
drop function if exists xt.text_gt_date(text,date);

drop function if exists xt.text_lt_date(text,date);

drop table xt.temp_sa_3_dates;
drop table xt.temp_sa_3_items;
drop table xt.temp_sa_3_summ;
drop table xt.vendinfoext;
drop table xt.potype;

drop function if exists xt.add_priv(text,text,text,text,text); -- depends on schema xt
dr schema xt
drop function if exists xt.begins_with(text,text); -- depends on schema xt
drop function if exists xt.ends_with(text,text); -- depends on schema xt
drop function if exists xt.not_any_numeric(numeric,numeric[]); -- depends on schema xt
drop function if exists xt.not_any_text(text,text[]); -- depends on schema xt
drop function if exists xt.record_did_change(); -- depends on schema xt
drop trigger if exists labelform_did_change on labelform; -- depends on function xt.record_did_change()
drop function if exists xt.text_gt_date(text,date); -- depends on schema xt
drop function if exists xt.text_lt_date(text,date); -- depends on schema xt



drop trigger if exists labelform_did_change; -- on table labelform depends on function xt.record_did_change()
drop function if exists xt.record_did_change(); -- depends on schema xt

drop view if exists xm.form; -- depends on schema xm
drop view if exists xm.label_form; -- on schema xm
drop view if exists xm.ship_form;   -- on schema xm

drop trigger if exists function xt._allur_docasstrigger();

-- end of 4.9.5 changes








drop schema sys;
drop schema xm;
drop schema xt;
alter table pkghead disable trigger all;
delete from pkghead where pkghead_name='xt';
alter table pkghead enable trigger all;


create or replace function public.geteffectivextuser()
 returns text
 language plpgsql
 stable
as $function$
-- copyright (c) 1999-2012 by openmfg llc, d/b/a xtuple.
-- see www.xtuple.com/cpal for the full text of the software license.
begin
/*
 the default return value of this function is simply
 the user currently connected.

 overload this function from another schema
 to implement specific user handling from an external
 application that uses connection pooling.
 use seteffectivextuser(text) to create a temporary table that
 inserts user data that can in turn be used as a lookup
 reference for an over loaded version of this function like so:

 select effective_value
 from effective_user
 where effective_key = 'username'
*/

 return current_user;

end;
$function$;



