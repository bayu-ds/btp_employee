using trail01.emp as emp from '../db/data-mode';

service EmployeeSrv {
    entity EMPLOYEES @(
        Capabilities : { 
            InsertRestrictions : {
                $Type : 'Capabilities.InsertRestrictionsType',
                Insertable
            },
            UpdateRestrictions : {
                $Type : 'Capabilities.UpdateRestrictionsType',
                Updatable
            },
            DeleteRestrictions : {
                $Type : 'Capabilities.DeleteRestrictionsType',
                Deletable
            }
         }
    )
    as select from emp.EMPLOYEE_REGISTRY;
    annotate EMPLOYEES with @odata.draft.enabled;
    

    @readonly entity DEPARTMENT as select from emp.DEPARTMENT;
    annotate DEPARTMENT with @odata.draft.enabled;
    
}

annotate EmployeeSrv.EMPLOYEES with @(
    UI:{
        // Filter
        SelectionFields : [
            DEPARTMENT_ID
        ],

        // Table Column
        LineItem : [
            {
                $Type : 'UI.DataField',
                Value : NAME,
            },{
                $Type : 'UI.DataField',
                Value : EMAIL_ID,
            },{
                $Type : 'UI.DataField',
                Value : DEPARTMENT_ID,
            }
        ],

        //Facets (detail object page)
        Facets : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Default',
                ID : 'Default',
                Label : 'General',
            }
        ],

        FieldGroup #Default : {
            $Type : 'UI.FieldGroupType',
            Data: [
                {
                    $Type : 'UI.DataField',
                    Value : NAME
                },{
                    $Type : 'UI.DataField',
                    Value : EMAIL_ID,
                },{
                    $Type : 'UI.DataField',
                    Value : DEPARTMENT_ID
                }
            ]
        },
    }
){
    NAME @title : 'Name';
    EMAIL_ID @title : 'Email ID';
    DEPARTMENT @(
        title : 'Department',
        Common : { 
            ValueListWithFixedValues,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'DEPARTMENT',
                Label : 'Departments',
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterOut',
                        LocalDataProperty : DEPARTMENT_ID,
                        ValueListProperty : 'ID',
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'NAME',
                    }
                ],
            },
         },
    )
}
