<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true"
    CodeFile="payment_form.aspx.cs" Inherits="secureacceptance._Default" %>
<%
    /** configuration **/
    string responsePage = "https://httpbin.org/post";
%>
<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="Styles/payment.css"/>
    <script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
</head>
<body>

<form id="payment_form" action="payment_confirmation.aspx" method="post">
    <input type="hidden" name="profile_id" value="<%= secureacceptance.Config.PROFILE_ID %>">
    <input type="hidden" name="access_key" value="<%= secureacceptance.Config.ACCESS_KEY %>">
    <input type="hidden" name="transaction_uuid" value="<% Response.Write(getUUID()); %>">
    <input type="hidden" name="merchant_descriptor"  value="Krungsri">
    <input type="hidden" name="override_custom_cancel_page"  value="<%= responsePage %>">
	<input type="hidden" name="override_custom_receipt_page" value="<%= responsePage %>">
    <input type="hidden" name="signed_field_names" value="profile_id,access_key,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,payment_method,transaction_type,reference_number,auth_trans_ref_no,amount,currency,merchant_descriptor,override_custom_cancel_page,override_custom_receipt_page">
    <input type="hidden" name="unsigned_field_names" value="device_fingerprint_id,bill_to_forename,bill_to_surname,bill_to_email,bill_to_phone,bill_to_address_line1,bill_to_address_line2,bill_to_address_city,bill_to_address_state,bill_to_address_country,bill_to_address_postal_code,customer_ip_address">
    <input type="hidden" name="signed_date_time" value="<% Response.Write(getUTCDateTime()); %>">
    
    <fieldset>
        <legend>Payment Details</legend>
        <div id="paymentDetailsSection" class="section">
            <span>payment_method:</span><input type="text" name="payment_method" value="card" size="25"><br/>
            <span>transaction_type:</span><input type="text" name="transaction_type" size="25"><br/>
            <span>reference_number:</span><input type="text" name="reference_number" size="25"><br/>
            <span>auth_trans_ref_no:</span><input type="text" name="auth_trans_ref_no" size="25"><br/>
            <span>amount:</span><input type="text" name="amount" size="25"><br/>
            <span>currency:</span><input type="text" name="currency" size="25"><br/>
            <span>locale:</span><input type="text" name="locale" value="en-us" size="25"> en-us | th-th | ja-jp
        </div>
    </fieldset>
    <fieldset>
        <legend>Billing Information</legend>
            <span>bill_to_forename:</span><input type="text" name="bill_to_forename" value="Krungsri" size="25"><br/>
            <span>bill_to_surname:</span><input type="text" name="bill_to_surname" value="Simple" size="25"><br/>
            <span>bill_to_email:</span><input type="text" name="bill_to_email" value="customer@mail.com" size="25"><br/>
            <span>bill_to_phone:</span><input type="text" name="bill_to_phone" value="+6622962000" size="25"><br/>
            <span>bill_to_address_line1:</span><input type="text" name="bill_to_address_line1" value="1222 Rama III Road" size="25"><br/>
            <span>bill_to_address_line2:</span><input type="text" name="bill_to_address_line2" value="Bang Phongphang" size="25"><br/>
            <span>bill_to_address_city:</span><input type="text" name="bill_to_address_city" value="Yan Nawa" size="25"><br/>
            <span>bill_to_address_state:</span><input type="text" name="bill_to_address_state" value="Bangkok" size="25"><br/>
            <span>bill_to_address_country:</span><input type="text" name="bill_to_address_country" value="TH" size="25"><br/>
            <span>bill_to_address_postal_code:</span><input type="text" name="bill_to_address_postal_code" value="10120" size="25"><br/>
            <span>customer_ip_address:</span><input type="text" name="customer_ip_address" value="127.0.0.1" size="25"><br/>
        <div id="billingInformation" class="section">
        </div>
    </fieldset>
    <input type="submit" id="submit" name="submit" value="Submit"/>
    <script type="text/javascript" src="Scripts/payment_form.js"></script>
</form>
</body>
</html>
