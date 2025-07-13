report 60315 ProcessingOnlyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnAfterGetRecord()
            begin
                counter += 1;
            end;
        }
    }
    trigger OnInitReport()
    begin
        Clear(counter);
    end;

    trigger OnPostReport()
    begin
        Message('Procitanih redova tabele Kupac: %1', counter);
    end;

    var
        counter: Integer;
}