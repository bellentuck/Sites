// initial, inactive state
var state = {
  activeTranscription: {
    registerIndex: 0,  // '-'
    folioIndex: 0,
    vtnIndex: 0,
    imageurl: ''
  },
  visibilityFilter: "SHOW_NONE" // "SHOW_ACTIVE", "SHOW_ALL", "SHOW_VISITED", etc.
}

// non-initial, active state
state = {
  activeTranscription: {
    registerIndex: document.myForm.Register.selectedIndex;
    folioIndex: document.myForm.Folio.selectedIndex;
    vtnIndex: document.myForm.Voci_Transcript_Number.selectedIndex;
    imageurl: document.querySelector('#transimg a').href;
  },
  visibilityFilter: "SHOW_ACTIVE"
}





var folio = document.getElementById("foliodiv");

    // var filename = "/transcriptions-txt/" + myForm.Register.options[myForm.Register.selectedIndex].value + "_" + myForm.Folio.options[myForm.Folio.selectedIndex].value + "_" + myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value + "_" + k + ".txt"

//just some notes on toggling
//basically may want to redo some plumbing for this page...


//WORKS!!!!!!!
$(document).ready(function(){
    $("#registerdiv").click(function(){
        $("#foliodiv").slideToggle();
    });
});
