function checkEmail(email) {
    var regExp = /(^[a-z]([a-z_\.]*)@([a-z_\.]*)([.][a-z]{3})$)|(^[a-z]([a-z_\.]*)@([a-z_\.]*)(\.[a-z]{3})(\.[a-z]{2})*$)/i;
    return regExp.test(email);
}

$(document).ready(function(){
    $("#invite_writer").click(function(e){
        var emails = document.getElementById("email_text").value;
        var emailArray = emails.split(",");
        var invEmails = "";
        for(i = 0; i <= (emailArray.length - 1); i++){
            if(checkEmail(emailArray[i])){
                //Do what ever with the email.
            }else{
                invEmails += emailArray[i] + "\n";
            }
        }
        if(invEmails != ""){
            alert("You have Invalid Emails:\n" + invEmails);
            $("#email_text").focus();
            return false
        }
    })
});