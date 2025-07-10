pageextension 60312 CustomerExtension extends "Customer List"
{
    trigger OnOpenPage()
    begin
        report.Run(Report::BasicReport)
    end;
}