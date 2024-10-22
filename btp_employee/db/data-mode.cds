namespace trail01.emp;

using { cuid, managed } from '@sap/cds/common';

entity EMPLOYEE_REGISTRY : cuid, managed {
    NAME: String(255);
    EMAIL_ID: String(255);

    DEPARTMENT: Association to one DEPARTMENT;
}

entity DEPARTMENT : cuid {
    NAME: String(255);

    EMPLOYEES: Association to many EMPLOYEE_REGISTRY on EMPLOYEES.DEPARTMENT = $self;
}