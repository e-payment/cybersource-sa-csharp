<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment_confirmation.aspx.cs" Inherits="secureacceptance.WebForm1" %>
<%
    /** configuration **/
    string merchant_id = secureacceptance.Config.MERCHANT_ID;

    /** deviceFingerprintID **/
	string org_id     = "1snn5n9w"; // TEST: 1snn5n9w, LIVE: k8vif92e
	string sess_id    = System.Web.HttpContext.Current.Session.SessionID;
	string df_param   = "org_id=" + org_id + "&session_id=" + merchant_id + sess_id;
    string paymentUrl = "https://testsecureacceptance.cybersource.com/pay";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="Styles/payment.css"/>
</head>
<body>

<!-- START DEVICE FINGERPRINTING CODE (One-Pixel Image Code) -->
<p style="background:url(https://h.online-metrix.net/fp/clear.png?<%= df_param %>&m=1)"></p> 
<img src="https://h.online-metrix.net/fp/clear.png?<%= df_param %>&m=2" width="1" height="1" />
<!-- END DEVICE FINGERPRINTING CODE -->

<form id="payment_confirmation" action="<%= paymentUrl %>" method="post"/>
<fieldset id="confirmation">
    <legend>Review Payment Details</legend>
    <div>
        <%
            foreach (var key in Request.Form.AllKeys)
            { 
                Response.Write("<div>");
                Response.Write("<span class=\"fieldName\">" + key + ":</span><span class=\"fieldValue\">" + Request.Params[key] + "</span>");
                Response.Write("</div>\n");
            }
        %>
    </div>
</fieldset>
    <%
        IDictionary<string, string> parameters = new Dictionary<string, string>();
        foreach (var key in Request.Form.AllKeys)
        {
            Response.Write("<input type=\"hidden\" id=\"" + key + "\" name=\"" + key + "\" value=\"" + Request.Params[key] + "\"/>\n");
            parameters.Add(key, Request.Params[key]);
        }
        Response.Write("<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" + secureacceptance.Security.sign(parameters, secureacceptance.Config.SECRET_KEY) + "\"/>\n");
    %>
device_fingerprint_id: <%= sess_id %> <input type="hidden" name="device_fingerprint_id" value="<%= sess_id %>" /><br/>
<input type="submit" id="submit" value="Confirm"/>
</form>
</body>
</html>
