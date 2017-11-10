<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="NumberToWords_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Number To Words</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
            <!-- Page Style Classes -->
    <link href="../CSS/bootstrap.min.css" rel="stylesheet" />
    <link href="../CSS/components-md.min.css" rel="stylesheet" />
    <link href="../CSS/layout.min.css" rel="stylesheet" />
           <!-- Page Script Classes -->
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <style>
        .form-control {
            border-radius: 0px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 50px;">
            <asp:Panel runat="server" ID="pnlMainPage" Visible="true">
                <div class="row">
                    <div class="col-md-12">
                        <div class="tabbable-line boxless tabbable-reversed">
                            <div class="tab-pane" id="tab_2">
                                <div class="portlet box green">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            Add Records 
                                        </div>

                                    </div>
                                    <div class="portlet-body form">
                                        <!-- BEGIN FORM-->
                                        <div class="form-horizontal">
                                            <div class="form-body">
                                                <h3 class="form-section">Add</h3>
                                                <div class="row">
                                                    <asp:TextBox ID="txtMode" runat="server" Visible="false"></asp:TextBox>
                                                    <div id="divError" runat="server" visible="false" class="alert alert-danger fade in m-b-15">
                                                        <strong>Error!</strong>
                                                        <asp:Label ID="lblError" runat="server"></asp:Label>

                                                        <span class="close" data-dismiss="alert">&times;</span>
                                                    </div>
                                                    <div id="divSuccess" runat="server" visible="false" class="alert alert-success fade in m-b-15">
                                                        <strong>Success!</strong>
                                                        <asp:Label ID="lblSuccess" runat="server"></asp:Label>
                                                        <span class="close" data-dismiss="alert">&times;</span>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3">
                                                                Person Name
                                                        <span class="required">* </span>
                                                            </label>
                                                            <div class="col-md-9">
                                                                <input id="txtPersonName" runat="server" maxlength="25" onkeypress="return IsAlphaNumeric(event)" required type="text" class="form-control" placeholder="Name"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3">
                                                                Number
                                                        <span class="required">* </span>
                                                            </label>
                                                            <div class="col-md-9">
                                                                <input id="txtNumber" runat="server" maxlength="15" onkeypress="return isNumberKey(event)" required type="text" class="form-control" placeholder="Number"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>

                                            </div>
                                            <div class="form-actions">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="row">
                                                            <div class="col-md-offset-3 col-md-9">
                                                                <asp:Button ID="btnSubmit" Style="border-radius: 0;" OnClick="btnSubmit_Click" runat="server" Text="Submit" CssClass="btn green" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END FORM-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </asp:Panel>
            <asp:Panel ID="tablepanel" runat="server">
                <div class="portlet box green">
                    <div class="portlet-title">
                        <div class="caption">
                           Show Records
                        </div>
                    </div>
                    <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                        <div class="form-horizontal">
                            <div class="form-body">
                                <table class="table table-striped" id="records_tbl">
                                    <thead>
                                        <tr>
                                            <th>Person Name</th>
                                            <th>Orignal Number</th>
                                            <th>Number In Words</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
<script>
    $(document).ready(function () {
        getallRecords();
    });
    function getallRecords() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../NumberToWords/NumberToWord.asmx/GetAllRecords",
            dataType: "json",
            success: function (data) {
                debugger;
                if (data) {
                    if (data.d.length > 0) {
                        for (var i = 0; i < data.d.length; i++) {
                            debugger;
                            $("#records_tbl").find('tbody').append("<tr><td>" + data.d[i].PersonName + "</td>  <td>" + data.d[i].OrignalNumber + "</td> <td>" + data.d[i].ConvertedNumber + "</td></tr>");
                        }
                        //alert(data.d);
                    }
                }
            },
            error: function (result) {
                console.log("Error");
            }
        });
    }
</script>
<script>
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode != 46 && charCode > 31
          && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    function IsAlphaNumeric(evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (charCode != 46 && charCode > 31
          && (charCode < 48 || charCode > 57))
            return true;

        return false;

    }
</script>
</html>
