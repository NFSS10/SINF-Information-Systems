$(document).ready(function() {
    handleSubmission();
    popOvers();
});


function popOvers() {
    $('[data-toggle="popover"]').popover();
}

function handleSubmission() {

    $("form.modal_form").submit(function () {
        switch(this.id) {
            case "login_modal_form":

                var username= $('#login_username').val();
                var password= $('#login_password').val();
                $.post(BASE_URL + "api/users/login.php", {username: username, password: password}, function(data) {
                    if(data.length != 0) {
                        $('#login_error_alert').text(data['reason']);
                        $('#login_error_alert').show();
                        $('#login_error_alert').delay(5000).fadeOut(500);
                    }
                    else {
                        location.reload();
                    }
                }, "json");

                return false;
                break;
            case "reg_modal_form":
                var rg_username= $('#reg_modal_form .input_username').val();
                var rg_email= $('#reg_modal_form .input_email').val();
                var rg_password = $('#reg_modal_form .input_password').val();
                var rg_conf_password = $('#reg_modal_form .input_conf_password').val();
                var rg_name = $('#reg_modal_form .input_name').val();
                var rg_nif = $('#reg_modal_form .input_nif').val();
                var rg_address = $('#reg_modal_form .input_address').val();
                var rg_town = $('#reg_modal_form .input_town').val();
                var rg_bday = $('#reg_modal_form .input_birthday_date').val();
                var rg_postcode1 = $('#reg_modal_form .input_postal_code1').val();
                var rg_postcode2 = $('#reg_modal_form .input_postal_code2').val();

                var bday = new Date(rg_bday);
                var atualDate = new Date();

                var age = Math.floor((atualDate-bday) / (365.25 * 24 * 60 * 60 * 1000));

                var proceed = true;

                if(!validateUsername(rg_username))
                {
                    showError('#reg_username input', '#reg_username a');
                    proceed = false;
                }

                if(!validateEmail(rg_email))
                {
                    showError('#reg_email input', '#reg_email a');
                    proceed = false;
                }

                if(rg_password != rg_conf_password){
                    showError('#reg_password input', '#reg_password a');
                    showError('#reg_password2 input', '#reg_password2 a');
                    proceed = false;
                }

                if(!validateName(rg_name))
                {
                    showError('#reg_name input', '#reg_name a');
                    proceed = false;
                }

                if(rg_nif.length != 9)
                {
                    showError('#reg_nif input', '#reg_nif a');
                    proceed = false;
                }

                if(rg_address.length < 5)
                {
                    showError('#reg_address input', '#reg_address a');
                    proceed = false;
                }

                if(rg_town.length < 5)
                {
                    showError('#reg_town input', '#reg_town a');
                    proceed = false;
                }

                if(age < 18)
                {
                    showError('#reg_birthday input', '#reg_birthday a');
                    proceed = false;
                }

                if(rg_postcode1.length != 4 || rg_postcode2.length != 3)
                {
                    $("#reg_postal_code a").show();
                    $("#reg_postal_code a").delay(2000).fadeOut(2500);
                    proceed = false;
                }

                if(proceed)
                {

                    var ddBday = bday.getDate();
                    var mmBday = bday.getMonth()+1;
                    var yyyyBday = bday.getFullYear();

                    var bdayDate = yyyyBday + '-' + mmBday + '-' + ddBday;

                    var dd = atualDate.getDate();
                    var mm = atualDate.getMonth()+1;
                    var yyyy = atualDate.getFullYear();

                    var registerDate = yyyy + '-' + mm + '-' + dd;

                    var postal_code = rg_postcode1 + '-' + rg_postcode2;

                    $.post(BASE_URL + "api/users/register.php", {
                        username: rg_username,
                        password: rg_password,
                        email: rg_email,
                        name: rg_name,
                        nif: rg_nif,
                        address: rg_address,
                        town: rg_town,
                        pcode: postal_code,
                        birthday: bdayDate,
                        regdate: registerDate
                    }, function (data) {
                        if (data.length != 0) {
                            $('#reg_error_alert').text(data['reason']);
                            $('#reg_error_alert').show();
                            $('#reg_error_alert').delay(5000).fadeOut(2500);
                        }
                        else {
                            $('#reg_succ_alert').show();
                            $('#reg_succ_alert').delay(5000).fadeOut(2500);
                            $('#reg_modal_form')[0].reset();
                        }
                        scrollToTop();
                    }, "json");

                }

                return false;
                break;
            default:
                return false;
        }
        return false;
    });


    function validateUsername(username) {
        var admin = "admin";
        var pattern = new RegExp(/^[a-z0-9]{3,30}$/);

        if(!pattern.test(username) || username.toLowerCase().indexOf(admin) !=-1)
            return false;

        return true;
    }

    function validateEmail(email) {
        var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
        return pattern.test(email);
    }

    function validateName(name){
        var pattern = new RegExp(/\w+([ ]{1,1}\w){0,5}/);
        if(!pattern.test(name))
            return false;
        else {
            var result = name.replace(/ /g, "");
            if(result.length < 3)
                return false;
        }
        return true;
    }

    function showError(selector1, selector2)
    {
        $(selector1).css("width", "95%");
        $(selector2).show();
        $(selector2).delay(2000).fadeOut(2500);
        setTimeout( function(){
            $(selector1).css("width", "100%");
        },4500);
    }

    function scrollToTop() {
        $('#register-modal').animate({scrollTop: 0}, 500, 'linear');
    }

}