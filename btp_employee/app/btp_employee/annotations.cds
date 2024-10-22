using EmployeeSrv as service from '../../srv/employee-srv';
annotate service.EMPLOYEES with @(

    // General Information
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'NAME',
                Value : NAME,
            },
            {
                $Type : 'UI.DataField',
                Label : 'EMAIL_ID',
                Value : EMAIL_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : DEPARTMENT_ID
            }
        ],
    },

    UI.FieldGroup #Admin : {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Label : 'Created At',
                Value : createdAt,
            },
            {
                $Type: 'UI.DataField',
                Label : 'Created By',
                Value : createdBy,
            }            
        ]
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'AdminData',
            Label : 'Administration',
            Target : '@UI.FieldGroup#Admin',            
        }
    ],

    //Object Page
    UI.HeaderInfo  : {
        TypeName : 'Employee',
        TypeNamePlural : 'Employees',
        Title: {
            $Type: 'UI.DataField',
            Value: NAME
        },
        Description: {
            $Type: 'UI.DataField',
            Value:  ID
        }
    },

    // Part of General Information
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Full Name',
            Value : NAME,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Email',
            Value : EMAIL_ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Department ID',
            Value : DEPARTMENT_ID
        },        
    ],
);

annotate service.EMPLOYEES with {
    DEPARTMENT @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'DEPARTMENT',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : DEPARTMENT_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'NAME',
            },
        ],
    }
};

