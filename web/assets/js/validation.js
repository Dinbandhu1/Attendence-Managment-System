/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validate()
{
    var username=document.form.username.value;
    
var password = document.form.password.value;
var cpassword= document.form.cpassword.value;
var usercheck=/^[A-Za-z. ]{3,30}$/;
var passwordcheck=/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;

if(usercheck.test(username)){
        document.getElementById('usererror').innerHTML=" ";
    }else{
        document.getElementById('usererror').innerHTML=" ** Username Is invalid ";
        return false;
    }
    if(passwordcheck.test(password)){
        document.getElementById('passworderror').innerHTML=" ";
    }else{
        document.getElementById('passworderror').innerHTML=" ** Password Is invalid ";
        return false;
    }
     if(cpassword.match(password)){
        document.getElementById('conformpassworderror').innerHTML=" ";
    }else{
        document.getElementById('conformpassworderror').innerHTML=" ** ConformPassword Is No Match Password ";
        return false;
    
    }
    confirm('Are you sure you want to delete this item?');

} 
