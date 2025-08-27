# Product Requirements Document (PRD)  
### SaaS Platform for Enterprise Data Management and Process Automation

---

## Introduction / Overview  
This SaaS platform enables companies and enterprises to organize and manage their organizational data—such as CMDB, HR, referential data (locations, users, groups, companies), financial portfolios, and more. The platform provides both a backoffice interface for privileged users and a simplified frontend portal for end users. It supports customizable tables and fields, role-based access controls, scoped applications for multi-tenancy, server-side scripting, and extensible integrations. The upcoming import feature enables users to efficiently ingest data from multiple file formats into the system with appropriate mapping and validation.

---

## Goals / Objectives  
- Deliver an MVP import feature supporting XLSX, XML, CSV (and later JSON) allowing users to upload files, preview data in staging tables, map fields to target tables, and import without data loss.  
- Provide a flexible, user-friendly mapping interface with auto-mapping suggestions and manual mapping assist tools.  
- Ensure robust role-based access control for all platform functionalities, including import operations, scoped app isolation, and configuration management.  
- Enable system admins to create custom tables, fields, roles, ACLs, business rules, and automation for tailored enterprise workflows.  
- Support multi-tenant application scoping to isolate data, users, and roles by app scope.  
- Allow system user personalization: language preferences and table column customization per user without affecting others.  
- Implement clear, actionable notifications and error messages to maximize data quality and user confidence.  
- Establish a manageable architecture where the backoffice supports administrative and configuration tasks, while the frontend portal provides simplified access for regular end users.  
- Provide users the ability to create reports on any accessible table and build dashboards with multiple reports as widgets, organized into tabs.  
- Ensure performance and security by limiting the number of reports loaded consecutively on dashboard load, configurable by admins.  
- Support sharing of reports and dashboards with users, roles, and groups for collaboration.  
- Facilitate comprehensive CRUD operations on data and schema objects including tables, inherited tables, and fields.  
- Support data export in multiple formats (XML, JSON, PDF, CSV, Excel) for data lists, forms, reports, and dashboards in addition to image exports (JPEG, PNG).  
- Provide intuitive navigation across tables and records respecting user privileges, enhanced by a navigation pane for easier access.  
- Enable admins to access system and REST API logs for monitoring and troubleshooting.  
- Support user-driven and system-triggered email notifications, including custom emails from within the platform.  
- Enable in-system user notifications and real-time chat capabilities.

---

## Target Audience / User Personas  

| Persona Type    | Description | Access & Needs |
|-----------------|-------------|---------------|
| Regular User    | End users without assigned roles. Access own records, catalogs, requests, and knowledge base with view permissions. | Simplified portal UI, consult-only access per ACLs. |
| Fulfiller User  | Service agents (e.g. HR, service desk, CSM). Handle requests and update records with read/write roles. | Role-based access for request handling and data updates. |
| Portal Admin    | Admins managing the frontend portal layout, presented data, and user portals. | Limited to portal configuration and user views. |
| System Admin / Security Admin | Full access to create custom tables, fields, ACLs, roles, business rules, and scoped apps. Manage system-wide configuration and privileges. | Full backend access with scripting, API integrations, and automation capabilities. |
| External User   | Partners or consultants with specific scoped access and limited permissions. | Role-defined access scoped to specific apps or data. |

---

## User Stories / Use Cases  

- As a **regular user**, I want to browse configured catalogs and submit service requests through a simple portal interface so that I can easily get the services I need.  
- As a **fulfiller user**, I want to view, update, and manage requests assigned to me with the proper permissions to resolve end-user issues smoothly.  
- As a **system admin**, I want to create and manage custom tables and fields dynamically so that I can tailor the data model to the organization's needs without code changes.  
- As a **system admin**, I want to configure scoped apps isolating data and roles by application scope to maintain strong security and multi-tenancy.  
- As a **system admin**, I want to run custom server-side scripts, create business rules, and define REST APIs to automate data workflows and integrate with other systems.  
- As a **system admin**, I want to assign roles and ACLs with fine-grained filtering, table, and field-level permissions to enforce data security and compliance.  
- As a **system admin**, I want users to have personalized views, including choosing their language and displayed columns, to enhance usability and productivity.  
- As a **data importer user**, I want to upload files in XLSX, XML, and CSV formats, preview the import data in a staging table, map fields to existing tables with auto-suggestions, and execute the import to populate the system without data loss.  
- As a **data importer user**, I want the system to notify me of any import errors or warnings with clear, actionable messages, so I can fix issues efficiently.  
- As a **user**, I want to create reports on any table I have access to and build dashboards composed of one or more report widgets organized in multiple tabs, so I can visualize and analyze data effectively.  
- As a **system admin**, I want to configure limits on the number of reports loaded consecutively on dashboard load to preserve performance and ensure security.  
- As a **user**, I want to share reports and dashboards with other users, roles, and groups to enable collaboration and information sharing.  
- As a **user**, I want to perform CRUD operations across the platform, including creating tables, inherited tables, and fields, and modifying form and list layouts to tailor data entry and viewing.  
- As a **user**, I want to export list data or single record data to XML, JSON, PDF, CSV, and Excel formats for offline use and reporting.  
- As a **user**, I want to export reports and dashboards to the same data formats as well as JPEG and PNG for presentation and sharing.  
- As a **user**, I want to navigate intuitively through different tables and records based on my access rights and privileges, aided by a navigation pane for quick access.  
- As an **admin**, I want to consult system and REST API logs to monitor platform activity and troubleshoot issues.  
- As a **user**, I want to compose and send customized emails directly from the platform.  
- As a **system**, I want to send automatic emails triggered by events to keep users informed proactively.  
- As a **user**, I want to receive notifications inside the platform to stay aware of important updates.  
- As a **user**, I want to chat in real time with other users within the system to collaborate effectively.

---

## Functional Requirements  

### Import Feature  
- Upload XLSX, XML, CSV file formats via the React frontend UI to create a staging (import set) table inheriting from the uploaded file structure.  
- Provide UI to create and manage Transform Maps for field mapping between staging and target tables, including:  
  - Auto field mapping by matching field names with prefixes or exact names.  
  - Manual mapping assist form with slushbucket UI for unmapped and mapped fields.  
- Execute import with a UI action button that imports mapped data into the target table.  
- Display error/warning messages in a user-friendly manner linked to faulty rows or fields.  
- Restrict import actions to users with the appropriate roles (e.g., “import_admin”) as defined in ACLs.

### Reporting & Dashboards  
- Allow users to create reports on any table they have access to, with configurable filters and display options.  
- Allow users to build dashboards consisting of multiple tabs, where each tab can contain multiple report widgets.  
- Limit the number of reports loaded consecutively upon dashboard load for security and performance. This limit is configurable by the admin via the sys_properties table.  
- Enable sharing of reports and dashboards with other users, roles, and groups, respecting permissions.

### CRUD & Navigation  
- Enable users to perform full CRUD operations on data tables, including creating new tables, inherited tables, and fields dynamically through the UI.  
- Allow users to modify form and list layouts for customized data entry and display.  
- Support data export from lists and single records to XML, JSON, PDF, CSV, and Excel formats.  
- Support export of reports and dashboards to the same data formats as above, plus JPEG and PNG image formats.  
- Provide intuitive navigation across tables and records according to user access rights, enhanced by a navigation pane for quick access to platform features.

### Table & Field Inheritance and Lifecycle Management  
- When a new record is created in a parent table such as `sys_db_object` (which defines tables), the system automatically creates corresponding records in its parent table, `sys_metadata`, ensuring consistency across inherited metadata.  
- New tables inherit all fields from their parent tables. For example, creating a new table record in `sys_db_object` triggers creation of a `collection` type record in `sys_dictionary` representing its fields.  
- A matching record with the same `sys_id` is created in the `sys_metadata` parent table to maintain traceability and inheritance consistency across the platform metadata layer.  
- Deletion of a table cascades accordingly: deleting the record in `sys_db_object` results in deletion of the corresponding record in `sys_metadata`, the associated collection record, and all linked fields in `sys_dictionary`.  
- This cascading create/delete ensures referential integrity and synchronization between the platform’s metadata and actual database schema objects.

### System Logs & Email Notifications  
- Allow admins to consult system logs and REST API logs for platform monitoring and troubleshooting.  
- Enable users to send custom emails from within the system interface.  
- Support automatic event-based email notifications configured by admins with customizable templates.  
- Provide in-platform notifications for real-time user alerts.  
- Implement an in-system chat feature to enable user-to-user communication and collaboration.

### Platform Access & Roles  
- Support user roles and ACLs assigned to CRUD/view operations at table and field levels with support for filter conditions.  
- Differentiate and support internal, external, and scoped app roles, enforcing data isolation by scope.  
- Allow creation of new tables and fields dynamically by creating corresponding records (sys_db_object, sys_dictionary).  
- Allow admins to assign roles and ACLs in a flexible, configurable manner via a backoffice interface.

### Scripting & Automation  
- Enable system admins to run server-side scripts for automation and integration.  
- Support creation of custom REST APIs with multiple authentication options.  
- Support business rules capable of data manipulation before/after DB writes, data visibility control, and asynchronous execution via system jobs.  
- Support configurable email notifications with customizable layouts and trigger conditions.

### User Personalization  
- Allow each user to set their preferred interface language independently.  
- Allow users to customize the visible columns per table without affecting others.

### Interfaces  
- Provide a backoffice admin UI for privileged users to configure all system aspects, view/manage data, and create scoped apps.  
- Provide a simplified frontend portal UI for end users focusing on request submission, service catalog browsing, and follow-up.

---

## Non-Functional Requirements  

- Reliability: Reliable file upload, parsing, and import with no data loss or corruption.  
- Usability: Clear feedback messages, simple UI for import and mapping, accessible interfaces for all user roles.  
- Security: Role-based access enforced consistently at all layers. Scoped app isolation prevents unauthorized cross-access.  
- Performance: Efficient processing for typical file sizes in MVP; scalability plans for bulk operations in future releases.  
- Internationalization: Support multiple languages with per-user language settings.  
- Extensibility: Modular design for adding new data formats and integration endpoints.

---

## Design Considerations / Mockups  
- UI mockups for import file upload, staging table preview, and field mapping using slushbucket controls will be designed iteratively alongside requirements confirmation.  
- Backoffice and portal UI layouts will emphasize role-specific access and configurable views.  
- Dashboard/report creation interfaces will support drag-and-drop widget placement, tabs navigation, and sharing controls.

---

## Success Metrics  

| Metric                          | Target Goal                         |
|--------------------------------|-----------------------------------|
| Successful imports rate         | ≥ 95% for MVP supported formats   |
| User error resolution time      | Within 5 minutes for import issues |
| Role-based access violations   | < 0.1% unauthorized access events |
| User adoption (import feature) | 80% of target admin users actively using import within 3 months |
| System uptime                  | 99.9%                             |

---

## Open Questions / Future Considerations  
- Bulk import enhancements with batch processing and asynchronous job handling.  
- Support for additional import formats (JSON and others).  
- Extension of business rules with richer scripting languages or UI for rule creation.  
- Integration with external identity/access management systems.  
- Advanced notification channels (SMS, Slack, etc.) beyond email.  
- Enhanced real-time dashboard updates and advanced analytics features.

---
