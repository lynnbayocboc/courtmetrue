$(function() {
  $('a[title]').tooltip();
  $('.userProfile .btn-submit').on('click', function(e) {
    var formname, tabname;
    formname = $(this).attr('name');
    tabname = $(this).attr('href');
    if ($('#' + formname)[0].checkValidity()) {
      e.preventDefault();
      $('ul.nav li a[href="' + tabname + '"]').parent().removeClass('disabled');
      $('ul.nav li a[href="' + tabname + '"]').trigger('click');
    }
  });
  $('ul.nav li').on('click', function(e) {
    if ($(this).hasClass('disabled')) {
      e.preventDefault();
      return false;
    }
  });
});

$(function() {
  
  $('#profile_gender_male').click(function() {
    $("#courtship").css("display", "none");
  });
    $('#profile_gender_female').click(function() {
    $("#courtship").css("display", "unset");
  });
  
  $('.picture1').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    // here's the file size
    console.log(image.size);
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.style.width = '220px';
      img.style.height = '220px';
      console.log(file);
      img.src = file.target.result;
      $('#target1').html(img);
      $('.target1').css({"display": "unset"});
       $("img#nopicture1").hide();
      
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
  
    $('.picture2').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    // here's the file size
    console.log(image.size);
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.style.width = '220px';
      img.style.height = '220px';
      console.log(file);
      img.src = file.target.result;
      $('#target2').html(img);
      $('.target2').css({"display": "unset"});
       $("img#nopicture2").hide();
    }
    reader.readAsDataURL(image);
    console.log(files);
  });

  $('.picture3').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    // here's the file size
    console.log(image.size);
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
       img.style.width = '220px';
      img.style.height = '220px';
      console.log(file);
      img.src = file.target.result;
      $('#target3').html(img);
      $('.target3').css({"display": "unset"});
      $("img#nopicture3").hide();
      
    }
    reader.readAsDataURL(image);
    console.log(files);
  });

  $('.picture4').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    // here's the file size
    console.log(image.size);
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.style.width = '220px';
      img.style.height = '220px';
      console.log(file);
      img.src = file.target.result;
      $('#target4').html(img);
      $('.target4').css({"display": "unset"});
       $("img#nopicture4").hide();
      
    }
    reader.readAsDataURL(image);
    console.log(files);
  });


  $('.picture5').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    // here's the file size
   
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.style.width = '220px';
      img.style.height = '220px';
      console.log(file);
      img.src = file.target.result;
      $('#target5').html(img);
      $('.target5').css({"display": "unset"});
       $("img#nopicture5").hide();
      
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
  
});

$(function() {

var checkbox_checked = $('input[name="profile[courtship_preference_ids][]"]:checked').length;
var limit = 5;
var profile_gender = $('input:radio[name="profile[gender]"]:checked').val();

$('input[name="profile[courtship_preference_ids][]"]').on('change', function(evt) {
  var checkbox_checked = $('input[name="profile[courtship_preference_ids][]"]:checked').length;
  if ( checkbox_checked > 5) {
    
     alert("5 courtship preference only");
    this.checked = false;
  } 
});



$( "#text_area" ).on('input', function() {
    if ($(this).val().length>=50) {
        alert('Your profile heading: Maximum 50 characters. ');       
    }
});

});

function validateForm() {
  

  var profile_name = document.getElementById("profile_name").value;
  var profile_country = document.getElementById("profile_country");
  var profile_country_value = profile_country.options[profile_country.selectedIndex].value;
  var profile_state = document.getElementById("profile_state").value;
  var profile_city = document.getElementById("profile_city").value;
  var profile_gender = $('input:radio[name="profile[gender]"]:checked').val();
  var profile_status = $('input:radio[name="profile[status]"]:checked').val();
  var profile_religion = document.getElementById("profile_religion");
  var profile_religion_value = profile_religion.options[profile_religion.selectedIndex].value;
  var profile_ethnicity = document.getElementById("profile_ethnicity");
  var profile_ethnicity_value = profile_ethnicity.options[profile_ethnicity.selectedIndex].value;
  var profile_education = document.getElementById("profile_education");
  var profile_education_value = profile_education.options[profile_education.selectedIndex].value;
  var profile_household = document.getElementById("profile_household");
  var profile_household_value = profile_household.options[profile_household.selectedIndex].value;
  var profile_bodytype = document.getElementById("profile_bodytype");
  var profile_bodytype_value = profile_bodytype.options[profile_bodytype.selectedIndex].value;
  var profile_occupation = document.getElementById("profile_occupation").value;
  
  var profile_smoker = document.getElementById("profile_smoker");
  var profile_smoker_value = profile_smoker.options[profile_smoker.selectedIndex].value;
  
  var profile_drinker = document.getElementById("profile_drinker");
  var profile_drinker_value = profile_drinker.options[profile_drinker.selectedIndex].value;
  
  var profile_wantkids = document.getElementById("profile_wantkids");
  var profile_wantkids_value = profile_wantkids.options[profile_wantkids.selectedIndex].value;
  
  var profile_children = document.getElementById("profile_children");
  var profile_children_value = profile_children.options[profile_children.selectedIndex].value;
  
  var profile_experience = document.getElementById("profile_experience_with_courtship");
  var profile_experience_value = profile_experience.options[profile_experience.selectedIndex].value;

  
  var profile_religious = document.getElementById("profile_religious_values");
  var profile_religious_value = profile_religious.options[profile_religious.selectedIndex].value;
  var x = 0;
    
  var profile_heading = document.getElementById("text_area").value;
  var profile_selfbio = document.getElementById("profile_selfbio").value;
  var profile_ideal = document.getElementById("profile_ideal").value;
  
  var profile_terms = $('#profile_tandc:checkbox:checked').length > 0;
  
  var profile_weight = document.getElementById("profile_weight");
  var profile_weight_value = profile_weight.options[profile_weight.selectedIndex].value;
  
  var profile_height = document.getElementById("profile_height");
  var profile_height_value = profile_height.options[profile_height.selectedIndex].value;
  
    var profile_language = document.getElementById("profile_language");
  var profile_language_value = profile_language.options[profile_language.selectedIndex].value;
  
      var profile_dob_3i = document.getElementById("profile_dob_3i");
    var profile_dob_3i_value = profile_dob_3i.options[profile_dob_3i.selectedIndex].value;
    
        var profile_dob_2i = document.getElementById("profile_dob_2i");
    var profile_dob_2i_value = profile_dob_2i.options[profile_dob_2i.selectedIndex].value;
    
        var profile_dob_1i = document.getElementById("profile_dob_1i");
    var profile_dob_1i_value = profile_dob_1i.options[profile_dob_1i.selectedIndex].value;
   
  var birthday = 0; 
  
    var checkbox_checked = $('input[name="profile[courtship_preference_ids][]"]:checked').length;
  
  if (profile_gender == "Female" && checkbox_checked < 5) {
    $("#courtship_preference").css("display", "unset");
     x += 1;
  } else {
     $("#courtship_preference").css("display", "none");
  }
  
  
  if (profile_dob_3i_value == "") {
    birthday += 1;
  } 
  if (profile_dob_2i_value == "") {
    birthday += 1;
  } 
    if (profile_dob_1i_value == "") {
    birthday += 1;
  } 
  
  if (birthday > 0) {
  document.getElementById('dob').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('dob').style.display = 'none';
  }
  
    if (profile_language_value == "") {
  document.getElementById('language').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('language').style.display = 'none';
  }
  
  if (profile_height_value == "") {
  document.getElementById('height').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('height').style.display = 'none';
  }
  
  if (profile_weight_value == "") {
    document.getElementById('weight').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('weight').style.display = 'none';
  }
  
  if (profile_terms == false) {
    document.getElementById('tandc').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('tandc').style.display = 'none';
  }
  
    if (profile_selfbio == "") {
    document.getElementById('selfbio').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('selfbio').style.display = 'none';
  }
  
    if (profile_ideal == "") {
    document.getElementById('ideal').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('ideal').style.display = 'none';
  }
  
  if (profile_heading == "") {
    document.getElementById('heading').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('heading').style.display = 'none';
  }
  
  if (profile_religious_value == "") {
    document.getElementById('religious').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('religious').style.display = 'none';
  }
    
  if (profile_experience_value == "") {
    document.getElementById('experience').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('experience').style.display = 'none';
  }
  
  if (profile_children_value == "") {
  document.getElementById('children').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('children').style.display = 'none';
  }
  
  if (profile_wantkids_value == "") {
    document.getElementById('wantkids').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('wantkids').style.display = 'none';
  }
  
    if (profile_drinker_value == "") {
    document.getElementById('drinker').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('drinker').style.display = 'none';
  }
  
  if (profile_smoker_value == "") {
    document.getElementById('smoker').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('smoker').style.display = 'none';
  }
  
  
    if (profile_bodytype_value == "") {
    document.getElementById('bodytype').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('bodytype').style.display = 'none';
  }
  
  if (profile_household_value == "") {
    document.getElementById('household').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('household').style.display = 'none';
  }
  
  if (profile_occupation == "") {
    document.getElementById('occupation').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('occupation').style.display = 'none';
  }
  
  if (profile_education_value == "") {
    document.getElementById('education').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('education').style.display = 'none';
  }
  
  if (profile_ethnicity_value == "") {
    document.getElementById('ethnicity').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('ethnicity').style.display = 'none';
  }
  
  if (profile_religion_value == "") {
    document.getElementById('religion').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('religion').style.display = 'none';
  }
  
  if (profile_gender == undefined) {
    document.getElementById('status').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('status').style.display = 'none';
  }
  
  if (profile_gender == undefined) {
    document.getElementById('gender').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('gender').style.display = 'none';
  }
  
  if (profile_city == "") {
    document.getElementById('city').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('city').style.display = 'none';
  }
  
  
  if (profile_state == "") {
    document.getElementById('state').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('state').style.display = 'none';
  }
  
  if (profile_name == "") {
    document.getElementById('name').style.display = 'unset';
    
  x += 1;
  } else {
    document.getElementById('name').style.display = 'none';
  }
  
  if (profile_country_value == "") {
    document.getElementById('country').style.display = 'unset';
    x += 1;
  } else {
    document.getElementById('country').style.display = 'none';
  }
  
  if(x > 0) {
    alert("Please complete your profile to use the website.");
    return false;
   
  } else {
    return true;
  }
}

$(function () {
  $('.upload').fileUploadUI({
        uploadTable: $('.upload_files'),
        downloadTable: $('.download_files'),
        buildUploadRow: function (files, index) {
            var file = files[index];
            return $('<tr><td>' + file.name + '<\/td>' +
                    '<td class="file_upload_progress"><div><\/div><\/td>' +
                    '<td class="file_upload_cancel">' +
                    '<div class="ui-state-default ui-corner-all ui-state-hover" title="Cancel">' +
                    '<span class="ui-icon ui-icon-cancel">Cancel<\/span>' +
                    '<\/div><\/td><\/tr>');
        },
        buildDownloadRow: function (file) {
            return $('<tr><td><img alt="Photo" width="40" height="40" src="' + file.pic_path + '">' + file.name + '<\/td><\/tr>');
        },
    });
});