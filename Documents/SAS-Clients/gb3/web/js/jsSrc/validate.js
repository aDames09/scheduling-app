/**
* @module Form Validation
*/

// @import 'libs/axios.js';
// @import '../loading/cookie.js';

/**
@class formValidationFunctions
@static
*/



/**
@method validation
*/


function validate (currentElement) {
  var error = 0;

  switch (currentElement.type) {
    case "email":

      var email = currentElement
      var emailValue = email.value
      var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

      if (!re.test(emailValue)) {
        error++;
        if (!email.nextElementSibling) {
          email.insertAdjacentHTML('afterend', '<span class="form_error">Please enter a valid email</span>')

        }
      } else if (re.test(emailValue)){
        if (email.nextElementSibling && email.nextElementSibling.classList[0] == "form_error") {
          email.nextElementSibling.outerHTML = "";
        }
      }
      break;
    case "number":

      var numberField = currentElement
      var fieldValue = numberField.value;
      re = /[a-zA-Z]/
      if (re.test(fieldValue) && !document.getElementById("number-error")) {
        error++;
        if(!numberField.nextElementSibling) {
        numberField.insertAdjacentHTML('afterend', '<span class="form_error">Please enter a valid number</span>')
        }
      } else if(!re.test(fieldValue)) {
        if (numberField.nextElementSibling && numberField.nextElementSibling.classList[0] == "form_error") {
          numberField.nextElementSibling.outerHTML = "";
        }
      }

      break;
    case "tel":
        var telephoneField = currentElement;
        var telValue = telephoneField.value;
        re = /^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/

        if (!re.test(telValue)) {
          error++
          if (!telephoneField.nextElementSibling) {
            telephoneField.insertAdjacentHTML('afterend', '<span class="form_error">Please enter a valid telephone number</span>')
          }
        } else if (re.test(telValue)){

          if (telephoneField.nextElementSibling && telephoneField.nextElementSibling.classList[0] == "form_error") {
            telephoneField.nextElementSibling.outerHTML = ""
          }
        }
      break;
    case "url":
        var urlField = currentElement
        fieldValue = urlField.value;

        re = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/;

        if (!re.test(fieldValue)) {
          error++
          if (!urlField.nextElementSibling) {
            urlField.insertAdjacentHTML('afterend', '<span class="form_error">Please enter a valid URL</span>')

          }
        } else if (re.test(fieldValue)) {
          if (urlField.nextElementSibling && urlField.nextElementSibling.classList[0] == "form_error") {
            urlField.nextElementSibling.outerHTML = "";
          }
        }
      break;
    case "date":
        var dateField = currentElement
        fieldValue = dateField.value;

        re = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/

        if (re.test(fieldValue)) {
          error++

          if (!dateField.nextElementSibling) {
            dateField.insertAdjacentHTML('afterend', '<span class="form_error">Please enter a valid date</span>')
          }
        } else if (!re.test(fieldValue)){
          if (dateField.nextElementSibling && dateField.nextElementSibling.classList[0] == "form_error") {
            dateField.nextElementSibling.outerHTML = "";
          }
        }

      break;
  }

  if (currentElement.minLength !== -1 && currentElement.value.length < currentElement.minLength) {
    error++

    if (!currentElement.nextElementSibling || currentElement.nextElementSibling.className !== "form_error length") {
      currentElement.insertAdjacentHTML('afterend', '<span class="form_error length">Please enter at least '+currentElement.minLength+' characters</span>');
    }
  } else if (currentElement.minLength !== -1 && currentElement.value.length >= currentElement.minLength && currentElement.nextElementSibling) {
    currentElement.nextElementSibling.className == "form_error" ? currentElement.nextElementSibling.outerHTML = "" : null;
  }

  if (error > 0) {
      currentElement.classList.add("input_error");
  }

  return error;
}

(function validation () {
    function formSubmit (event) {
      event.preventDefault();

      var formEvent = event.target;
      var inputElements = formEvent.querySelectorAll("input,textarea");
      var submitEnabled = 0;

      for (var inc = 0; inc < inputElements.length; inc++) {
        var currentElement = inputElements[inc];
        submitEnabled += validate(currentElement);
      }

      if (submitEnabled == 0) {
        //if form valid do something
        if (document.getElementById('form-submit-error')) {
          document.getElementById('form-submit-error').outerHTML = "";
        }
      } else if (submitEnabled > 0 && !document.getElementById('form-submit-error')) {
        formEvent.insertAdjacentHTML('afterend', '<span class="form_error-all"> There was an error with your form </div>')

      }

    }

    var form = document.getElementsByTagName('form');

    for (var i = 0; i < form.length; i++) {
      var formEvent;
      if (form[i].tagName !== "FORM") {
        formEvent = form[i].getElementsByTagName("form")[0];
      } else {
        formEvent = form[i];
      }

      formEvent.addEventListener('submit', formSubmit);

      formEvent.addEventListener('change', function (event) {
        validate(event.target);
      })
    }

}())
