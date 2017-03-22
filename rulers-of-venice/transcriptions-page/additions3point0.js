// // initial, inactive state // on document.ready:
// var state = {
//   activeTranscription: {
//     registerIndex: 0,  // '-'
//     folioIndex: 0,
//     vtnIndex: 0,
//     imageurl: ''
//   },
//   visibilityFilter: "SHOW_NONE" // "SHOW_ACTIVE", "SHOW_ALL", "SHOW_VISITED", etc.
// }



// slower option would be to traverse registers, folios, vtns for selected=true child
var thisRegister = myForm.Register.options[myForm.Register.selectedIndex].value;
var thisFolio = myForm.Folio.options[myForm.Folio.selectedIndex].value;
var thisVtn = myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value;

for (thisIndex = 0; thisIndex < myTS.transcripts.length; thisIndex++) {
  var temp = values(myTS.transcripts[thisIndex]);
  if (temp[0] === thisRegister && temp[1] === thisFolio && temp[2] === thisVtn) {
      break;
  }
}

var prev = document.getElementsByClassName('previousBtn');
var next = document.getElementsByClassName('nextBtn');

var prevIndex = thisIndex - 1 >= 0 ? thisIndex - 1 : myTS.transcripts.length - 1;
var prevRegister = values(myTS.transcripts[prevIndex])[0];
var prevFolio = values(myTS.transcripts[prevIndex])[1];
var prevVtn = values(myTS.transcripts[prevIndex])[2];
var nextIndex = thisIndex + 1 < myTS.transcripts.length ? thisIndex + 1 : 0;
var nextRegister = values(myTS.transcripts[nextIndex])[0];
var nextFolio = values(myTS.transcripts[nextIndex])[1];
var nextVtn = values(myTS.transcripts[nextIndex])[2];

var setNewSelectionInForm = function(formFieldNode, newValue) {
  for (var i=0; i<formFieldNode.length; i++) {
    if (formFieldNode[i].nodeType === 1 && formFieldNode[i].innerHTML === newValue) {
      formFieldNode[i].selected = true;
    }
  }
}

function resetRecord(newRegister, newFolio, newVtn) {
  myForm.Register.options[myForm.Register.selectedIndex].value = newRegister;
  myForm.Folio.options[myForm.Folio.selectedIndex].value = newFolio;
  myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value = newVtn;
  setlink();
  setNewSelectionInForm(document.getElementById('register'), newRegister);
  setNewSelectionInForm(document.getElementById('Folio'), newFolio);
  setNewSelectionInForm(document.getElementById('Voci_Transcript_Number'), newVtn);


  // for (var i=0; i<document.getElementById('register').length; i++) {
  //   if (document.getElementById('register')[i].nodeType === 1 && document.getElementById('register')[i].innerHTML === '6') {
  //     document.getElementById('register')[i].selected = true;
  //   }
  // }
// // #register.childNodes.[the 'option' where]innerHTML=newRegister => selected=true
// for (var i=0; i<c.length; i++) {
//   if (c[i].nodeType === 1 && c[i].innerHTML === newRegister) {
//     c[i].selected = true;
//   }
// }
  // //document.myForm.Register.selectedIndex.value = newRegister;
  // myForm.Register.options[myForm.Register.selectedIndex].value = newRegister;
  // $("#register").val(parseInt(newRegister)).prop('selected',true);
  // //document.myForm.Folio.selectedIndex.value = newFolio;
  // myForm.Folio.options[myForm.Folio.selectedIndex].value = newFolio;
  // $("#Folio").val(newFolio).prop('selected',true);
  // //document.myForm.Voci_Transcript_Number.selectedIndex.value = newVtn;
  // myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value = newVtn;
  // $("#trans").val(parseInt(newVtn)).prop('selected',true);
};


prev[0].addEventListener('click', function(){resetRecord(prevRegister, prevFolio, prevVtn)}, false);
next[0].addEventListener('click', function(){resetRecord(nextRegister, nextFolio, nextVtn)}, false);


// state = {
//   activeTranscription: {
//     registerIndex: document.myForm.Register.selectedIndex;
//     folioIndex: document.myForm.Folio.selectedIndex;
//     vtnIndex: document.myForm.Voci_Transcript_Number.selectedIndex;
//     imageurl: document.querySelector('#transimg a').href;
//   },
//   visibilityFilter: "SHOW_ACTIVE"
// }
