page 4021 "GP Migration Settings List"
{
    SourceTable = "GP Company Migration Settings";
    SourceTableView = where(Replicate = CONST(true));
    PageType = ListPart;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = true;
    Caption = 'Select company settings for data migration';
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(Companies)
            {
                ShowCaption = false;

                field("Name"; Rec."Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Name of the company';
                    Width = 6;
                }

#if not CLEAN22
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Global Dimension 1';
                    ToolTip = 'Global Dimension 1';
                    Width = 10;
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by page GP Migration Configuration';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Global Dimension 2';
                    ToolTip = 'Global Dimension 2';
                    Width = 10;
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by page GP Migration Configuration';
                }
                field("Migrate Inactive Customers"; Rec."Migrate Inactive Customers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Migrate Inactive Customers';
                    ToolTip = 'Specifies whether to migrate inactive customers.';
                    Width = 8;
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by page GP Migration Configuration';
                }
                field("Migrate Inactive Vendors"; Rec."Migrate Inactive Vendors")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Migrate Inactive Vendors';
                    ToolTip = 'Specifies whether to migrate inactive vendors.';
                    Width = 8;
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by page GP Migration Configuration';
                }
                field("Migrate Inactive Checkbooks"; MigrateInactiveCheckbooks)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Migrate Inactive Checkbooks';
                    ToolTip = 'Specifies whether to migrate inactive checkbooks.';
                    Width = 8;
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by page GP Migration Configuration';

                    trigger OnValidate()
                    var
                        GPCompanyAdditionalSettings: Record "GP Company Additional Settings";
                    begin
                        if not GPCompanyAdditionalSettings.Get(Rec.Name) then begin
                            GPCompanyAdditionalSettings.Name := Rec.Name;
                            GPCompanyAdditionalSettings."Migrate Inactive Checkbooks" := MigrateInactiveCheckbooks;
                            GPCompanyAdditionalSettings.Insert();
                        end else begin
                            GPCompanyAdditionalSettings."Migrate Inactive Checkbooks" := MigrateInactiveCheckbooks;
                            GPCompanyAdditionalSettings.Modify();
                        end;
                    end;
                }
                field("Migrate Vendor Classes"; MigrateVendorClasses)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Migrate Vendor Classes';
                    ToolTip = 'Specifies whether to migrate Vendor Classes.';
                    Width = 8;
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by page GP Migration Configuration';

                    trigger OnValidate()
                    var
                        GPCompanyAdditionalSettings: Record "GP Company Additional Settings";
                    begin
                        if not GPCompanyAdditionalSettings.Get(Rec.Name) then begin
                            GPCompanyAdditionalSettings.Name := Rec.Name;
                            GPCompanyAdditionalSettings."Migrate Vendor Classes" := MigrateVendorClasses;
                            GPCompanyAdditionalSettings.Insert();
                        end else begin
                            GPCompanyAdditionalSettings."Migrate Vendor Classes" := MigrateVendorClasses;
                            GPCompanyAdditionalSettings.Modify();
                        end;
                    end;
                }
                field("Migrate Customer Classes"; MigrateCustomerClasses)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Migrate Customer Classes';
                    ToolTip = 'Specifies whether to migrate Customer Classes.';
                    Width = 8;
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by page GP Migration Configuration';

                    trigger OnValidate()
                    var
                        GPCompanyAdditionalSettings: Record "GP Company Additional Settings";
                    begin
                        if not GPCompanyAdditionalSettings.Get(Rec.Name) then begin
                            GPCompanyAdditionalSettings.Name := Rec.Name;
                            GPCompanyAdditionalSettings."Migrate Customer Classes" := MigrateCustomerClasses;
                            GPCompanyAdditionalSettings.Insert();
                        end else begin
                            GPCompanyAdditionalSettings."Migrate Customer Classes" := MigrateCustomerClasses;
                            GPCompanyAdditionalSettings.Modify();
                        end;
                    end;
                }

                field("Migrate Item Classes"; MigrateItemClasses)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Migrate Item Classes';
                    ToolTip = 'Specifies whether to migrate Item Classes.';
                    Width = 8;
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by page GP Migration Configuration';

                    trigger OnValidate()
                    var
                        GPCompanyAdditionalSettings: Record "GP Company Additional Settings";
                    begin
                        if not GPCompanyAdditionalSettings.Get(Rec.Name) then begin
                            GPCompanyAdditionalSettings.Name := Rec.Name;
                            GPCompanyAdditionalSettings."Migrate Item Classes" := MigrateItemClasses;
                            GPCompanyAdditionalSettings.Insert();
                        end else begin
                            GPCompanyAdditionalSettings."Migrate Item Classes" := MigrateItemClasses;
                            GPCompanyAdditionalSettings.Modify();
                        end;
                    end;
                }
#endif
            }
        }
    }

#if not CLEAN22
    var
        MigrateInactiveCheckbooks: Boolean;
        MigrateVendorClasses: Boolean;
        MigrateCustomerClasses: Boolean;
        MigrateItemClasses: Boolean;
#endif
}