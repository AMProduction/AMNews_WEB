/**
 * Created by snooki on 18.05.16.
 */
$(document).ready(function() {
    $('#addUserForm').validate({
        
        rules:{

            lastName: {
                required: true,
                minlength: 2,
                maxlength: 32,
            },

            firstName: {
                required: true,
                minlength: 2,
                maxlength: 32,
            },

            login: {
                required: true,
                minlength: 2,
                maxlength: 32,
            },

            password: {
                required: true,
                minlength: 6,
                maxlength: 16,
            },

            repeatPassword: {
                required: true,
                equalTo: "#password"
            },

            position: {
                required: true,
            },

            accessLevel: {
                required: true,
            },
        },

        messages:{

            lastName:{
                required: "Поле обов'язкове для заповнення",
                minlength: "Мінімум 2 символи",
                maxlength: "Максимум 32 символи",
            },

            firstName:{
                required: "Поле обов'язкове для заповнення",
                minlength: "Мінімум 2 символи",
                maxlength: "Максимум 32 символи",
            },

            login:{
                required: "Поле обов'язкове для заповнення",
                minlength: "Мінімум 2 символи",
                maxlength: "Максимум 32 символи",
            },

            password:{
                required: "Поле обов'язкове для заповнення",
                minlength: "Мінімум 6 символів",
                maxlength: "Максимум 16 символів",
            },

            repeatPassword:{
                required: "Поле обов'язкове для заповнення",
            },

            position:{
                required: "Поле обов'язкове для заповнення",
            },

            accessLevel:{
                required: "Поле обов'язкове для заповнення",
            },
        }
    });
});