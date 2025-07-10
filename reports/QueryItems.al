query 60311 "Items"
{
    QueryType = Normal;
    Caption = 'Items Query';

    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.") { }
            column(Description; Description) { }
            column(Type; Type) { }
            column(Unit_Price; "Unit Price") { }
            column(Inventory; Inventory) { }
        }
    }
}