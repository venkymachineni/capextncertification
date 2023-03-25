using {EscalationManagementService as my} from './service';

annotate my.Escalations with @(
    Common.SideEffects #PurchaseOrderUpdated : {
        SourceProperties : [purchaseOrder_ID],
        TargetEntities   : [purchaseOrder]
    },
    UI                                       : {
        FieldGroup #GenInfo : {
            $Type : 'UI.FieldGroupType',
            Data  : [
                {
                    $Type : 'UI.DataField',
                    Value : description,
                    Label : 'Escalation Description',
                },
                {
                    $Type : 'UI.DataField',
                    Value : purchaseOrder_ID,
                    Label : 'Purchase Order NO',
                },
                {
                    $Type : 'UI.DataField',
                    Value : purchaseOrder.Supplier,
                    Label : 'Supplier',
                },
                {
                    $Type : 'UI.DataField',
                    Value : material,
                    Label : 'Material No.',
                },
                {
                    $Type : 'UI.DataField',
                    Value : expectedDate,
                    Label : 'Expected Date',
                },
                {
                    $Type : 'UI.DataField',
                    Value : status_code,
                    Label : 'Status',
                },

            ],
        },
        SelectionFields     : [
            status_code,
            purchaseOrder_ID
        ],
        LineItem            : [
            {
                $Type  : 'UI.DataFieldForAction',
                Action : 'EscalationManagementService.resolve',
                Label  : 'Resolve'
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Purchase Order NO',
                Value : purchaseOrder_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : purchaseOrder.Supplier,
                Label : 'Supplier',
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status_code,
            },
            {
                $Type : 'UI.DataField',
                Value : material,
                Label : 'Material No.',
            },
            {
                $Type : 'UI.DataField',
                Value : expectedDate,
                Label : 'Expected Date',
            }
        ],
        Facets              : [{
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#GenInfo',
            Label  : 'General Information'
        },
        {
                $Type  : 'UI.ReferenceFacet',
                Target : 'comments/@UI.LineItem',
                Label  : 'Comments'
        }]

    },

);

annotate my.Escalations with {
    status
    @Common : {Text : status.name    }

}

annotate my.Escalations with {

    description   @mandatory;
    purchaseOrder @mandatory;
    expectedDate  @mandatory;
    // purchaseOrder @(Common : {ValueList : {
    //     $Type          : 'Common.ValueListType',
    //     CollectionPath : 'purchaseOrder',
    //     Parameters     : [
    //         {
    //             $Type             : 'Common.ValueListParameterInOut',
    //             ValueListProperty : 'ID',
    //             LocalDataProperty : 'purchaseOrder_ID'
    //         },
    //         {
    //             $Type             : 'Common.ValueListParameterDisplayOnly',
    //             ValueListProperty : 'PurchaseOrderType'
    //         },
    //         {
    //             $Type             : 'Common.ValueListParameterDisplayOnly',
    //             ValueListProperty : 'Supplier'
    //         }
    //     ]
    // }})


}

annotate my.Comments with @(UI : {
    Identification : [
        {
            $Type : 'UI.DataField',
            Value : comment,
            Label : 'Comment',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ],
    LineItem       : [
        {Value : comment, },
        {Value : createdAt, }
    ],
    Facets         : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.Identification',
        Label  : ''
    }]
});