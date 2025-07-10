report 60312 BasicReport
{
    Caption = 'List of all customers';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = Basic_EXCELLayout;
    AllowScheduling = true;
    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting(Name);
            column(No_; "No.") { }
            column(Name; Name) { }
            column(Balance; Balance) { }
        }
    }

    rendering
    {
        layout(Basic_RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = 'layouts/BasicReport.rdl';
            Caption = 'BasicReport';
        }
        layout(Basic_WORDLayout)
        {
            Type = Word;
            LayoutFile = 'layouts/BasicReport.docx';
            Caption = 'BasicReport';
        }
        layout(Basic_EXCELLayout)
        {
            Type = Excel;
            LayoutFile = 'layouts/BasicReport.xlsx';
            Caption = 'BasicReport';
        }
    }

    //SaveValues=true;
    //AllowSchedulingProperty=true;
}