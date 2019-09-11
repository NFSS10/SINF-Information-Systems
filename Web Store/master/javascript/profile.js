$(document).ready(function() {

    editPersonalInfo();
});

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

function editPersonalInfo()
{
    var pi_toggle = 0;
    var si_toggle = 0;

    var name = $('#profile_container #p_edit_name').val();
    var bday = $('#profile_container #p_edit_bday').val();

    var address = $('#profile_container #p_edit_address').val();
    var town = $('#profile_container #p_edit_town').val();

    var pcode1 = $('#profile_container #p_edit_pcode1').val();
    var pcode2 = $('#profile_container #p_edit_pcode2').val();


    $('#profile_container .p_pi_form_item').hide();
    $('#profile_container .p_shipi_form_item').hide();
    $('#profile_container #profile_edit_buttons').hide();
    $('#profile_container #p_edit_error').hide();
    $('#profile_container #p_edit_error2').hide();


    $('#profile_container #profile_edit_buttons .btn-danger').click(function(){

        $('#profile_container .p_pi_form_item').hide();
        $('#profile_container .p_pi_item').show();

        $('#profile_container .p_shipi_item').show();
        $('#profile_container .p_shipi_form_item').hide();

        si_toggle = 0;
        pi_toggle = 0;

        displayButtons();

    });

    $('#profile_container #profile_edit_buttons .btn-success').click(function(){

        var up_name= $('#profile_container #p_edit_name').val();
        var up_bday = $('#profile_container #p_edit_bday').val();

        var up_address = $('#profile_container #p_edit_address').val();
        var up_town = $('#profile_container #p_edit_town').val();

        var up_pcode1 = $('#profile_container #p_edit_pcode1').val();
        var up_pcode2 = $('#profile_container #p_edit_pcode2').val();

        var bday = new Date(up_bday);
        var atualDate = new Date();

        var age = Math.floor((atualDate-bday) / (365.25 * 24 * 60 * 60 * 1000));

        var si_error = false;
        var pi_error = false;

        var pop_over_pi = $('#profile_container #p_edit_error').attr("data-content");
        if(!validateName(up_name) )
        {
            pop_over_pi =  pop_over_pi.replace(/pop_over_name/g,"pop_over_name text-danger");
            pi_error = true;
        }
        else
            pop_over_pi =  pop_over_pi.replace(/pop_over_name/g,"pop_over_name text-success");

        if(age < 18)
        {
            pop_over_pi =  pop_over_pi.replace(/pop_over_bday/g,"pop_over_bday text-danger");
            pi_error = true;
        }
        else
            pop_over_pi =  pop_over_pi.replace(/pop_over_bday/g,"pop_over_bday text-success");

        var string = $('#profile_container #p_edit_error2').attr("data-content");

        if(up_address.length < 5)
        {
            string =  string.replace(/pop_over_address/g,"pop_over_address text-danger");
            si_error = true;
        }
        else
            string =  string.replace(/pop_over_address/g,"pop_over_address text-success");

        if(up_town.length < 5)
        {
            string =  string.replace(/pop_over_town/g,"pop_over_town text-danger");
            si_error = true;
        }
        else
            string =  string.replace(/pop_over_town/g,"pop_over_town text-success");


        if(up_pcode1.length != 4 || up_pcode2.length != 3)
        {
            string =  string.replace(/pop_over_pop_over_pcode/g,"pop_over_town text-danger");
            si_error = true;
        }
        else
            string =  string.replace(/pop_over_pcode/g,"pop_over_town text-success");



        if(si_error)
        {
            $('#profile_container #p_edit_error2').attr("data-content", string);
            $('#profile_container #p_edit_error2').show();
            $('#profile_container #p_edit_error2').delay(5000).fadeOut(1000);
        }

        if(pi_error)
        {
            $('#profile_container #p_edit_error').attr("data-content", pop_over_pi);
            $('#profile_container #p_edit_error').show();
            $('#profile_container #p_edit_error').delay(5000).fadeOut(1000);
        }

        if(pi_error || si_error)
            return;

        $('#profile_container .p_pi_form_item').hide();
        $('#profile_container .p_pi_item').show();

        $('#profile_container .p_shipi_item').show();
        $('#profile_container .p_shipi_form_item').hide();

        si_toggle = 0;
        pi_toggle = 0;


        var ddBday = bday.getDate();
        var mmBday = bday.getMonth()+1;
        var yyyyBday = bday.getFullYear();

        var bdayDate = yyyyBday + '-' + mmBday + '-' + ddBday;

        var postal_code = up_pcode1 + '-' + up_pcode2;

        $.post(BASE_URL + "api/users/edit_profile.php", {
            name: up_name,
            birthday: bdayDate,
            address: up_address,
            town: up_town,
            pcode: postal_code
        }, function (data) {

            location.reload();
        }, "json");

    });


    $( "#profile_container #user_info_edit" ).click(function() {

        if(pi_toggle == 1)
            pi_toggle = 0;
        else
        {
            resetPersonalInputs();
            pi_toggle = 1;
        }

        $('#profile_container .p_pi_form_item').toggle();
        $('#profile_container .p_pi_item').toggle();



        displayButtons();
    });

    $( "#profile_container #user_shipping_info_edit" ).click(function() {

        if(si_toggle == 1)
            si_toggle = 0;
        else
        {
            resetShippingInputs();
            si_toggle = 1;
        }

        $('#profile_container .p_shipi_item').toggle();
        $('#profile_container .p_shipi_form_item').toggle();

        displayButtons();

    });

    function displayButtons()
    {
        if(pi_toggle + si_toggle > 0)
            $('#profile_container #profile_edit_buttons').show();
        else
            $('#profile_container #profile_edit_buttons').hide();
    }

    function resetPersonalInputs() {
        $('#profile_container #p_edit_name').val(name);
        $('#profile_container #p_edit_bday').val(bday);

    }

    function resetShippingInputs(){
        $('#profile_container #p_edit_address').val(address);
        $('#profile_container #p_edit_town').val(town);

        $('#profile_container #p_edit_pcode1').val(pcode1);
        $('#profile_container #p_edit_pcode2').val(pcode2);
    }
}