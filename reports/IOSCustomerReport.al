/*Mozete da napravite izvestaj IOS kupca Ovaj izvestaj treba da pokaze otvorene stavke kupca. To su stavke koje nalaze 
u tabeli Cust. Ledger Entry. Tu imate sve podatke. Na izvestaju treba da pokazete stavke gde je Open = true. 
Prikazete br dokumenta, datum knjizenja. Gore u zaglavlju podatke o kupcu. */
report 60314 IOSCustomer
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'layouts/IOSCustomerReport.rdl';
    Caption = 'IOS Customer Report';
    AllowScheduling = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";

            column(No_; "No.") { }
            column(Name; Name) { }
            column(Address; Address) { }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                DataItemTableView = sorting("Document No.");
                RequestFilterFields = "Document Type";
                column(Document_No_; "Document No.") { }
                column(Posting_Date; "Posting Date") { }
                column(Description; Description) { }
                column(Open; Open) { }
                trigger OnPreDataItem()
                begin
                    if isOpen then
                        "Cust. Ledger Entry".SetRange(Open, true);
                end;
            }
            trigger OnPreDataItem()
            begin
                if not Customer.GetFilters().Contains('No.') then
                    Error('Morate uneti sifru kupca');
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(isOpen; isOpen)
                    {
                        ApplicationArea = All;
                        Caption = 'Prikazi samo otvorene stavke';
                    }
                }
            }

        }
    }
    var
        isOpen: Boolean;
}
