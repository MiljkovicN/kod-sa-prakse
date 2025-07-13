report 60316 UpdateCustomerName
{
    Caption = 'Update Customer Name 2';
    ProcessingOnly = true;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem()
            begin
                Clear(Customer);
                Clear(Counter);
                if not ReplaceExisting then
                    customer.SetRange("Name 2", '');
            end;

            trigger OnAfterGetRecord()
            begin
                if UpdatedCustomer.get(Customer."No.") then begin
                    UpdatedCustomer."Name 2" := Name2;
                    UpdatedCustomer.Modify();
                    Counter += 1;
                end
            end;

            trigger OnPostDataItem()
            begin
                Message('Azurirano je %1 redova', Counter);
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
                    field(Name2; Name2)
                    {
                        ApplicationArea = All;
                        Caption = 'Name2 to apply';
                    }
                    field(ReplaceExisting; ReplaceExisting)
                    {
                        ApplicationArea = All;
                        Caption = 'Replace existing';
                    }
                }
            }
        }
    }

    var
        Name2: Text;
        UpdatedCustomer: Record Customer;
        ReplaceExisting: Boolean;
        Counter: Integer;
}