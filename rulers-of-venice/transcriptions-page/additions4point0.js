/////SCROLL DOWN, THIS FIRST STUFF'S JSUT NOTES
// var prevNextBtns = document.getElementById('prevNextBtns');
// var createPrevNextBtn = function(btnClass, btnText) {
//   var btn = document.createElement('a');
//   btn.class = btnClass;
//   btn.href = '#';
//   btn.appendChild(document.createTextNode(btnText));
//   prevNextBtns.appendChild(btn);
// };
// createPrevNextBtn('previousBtn', 'Previous transcription');
// createPrevNextBtn('nextBtn', 'Next transcription');

/////
// var prev = document.createElement('a');
// prev.class = 'previousBtn';
// prev.href = '#';
// prev.appendChild(document.createTextNode('Previous transcription'));
// prevNextBtns.appendChild(prev);
//
// var next = document.createElement('a');
// <a class="previousBtn" href="#">Previous transcription</a>
// <a class="nextBtn" href="#">Next transcription</a>


// at the top of setlink(), call getButtons() and setState().
//1)
var transcriptionState = setState();

// get buttons
//2)
var getButtons = function() {
  var prevNextBtns = document.getElementById('prevNextBtns');
  // button creator
  var createPrevNextBtn = function(btnClass, btnText) {
    var btn = document.createElement('a');
    btn.className = btnClass;
    btn.href = '#';
    btn.appendChild(document.createTextNode(btnText));
    prevNextBtns.appendChild(btn);
  };
  // create buttons
  createPrevNextBtn('previousBtn', 'Previous transcription');
  createPrevNextBtn('nextBtn', 'Next transcription');
  var prev = document.getElementsByClassName('previousBtn');
  var next = document.getElementsByClassName('nextBtn');
  // add event listeners to buttons
  prev[0].addEventListener('click', function(){resetRecord(
    transcriptionState.prev.register,
    transcriptionState.prev.folio,
    transcriptionState.prev.vtn
  )}, false);
  next[0].addEventListener('click', function(){resetRecord(
    transcriptionState.next.register,
    transcriptionState.next.folio,
    transcriptionState.next.vtn
  )}, false);
  // prev[0].addEventListener('click', function(){resetRecord(prevRegister, prevFolio, prevVtn)}, false);
  // next[0].addEventListener('click', function(){resetRecord(nextRegister, nextFolio, nextVtn)}, false);
};

//0)
var setState = function() {
  // get current transcript info (register, folio, vtn)
  var thisRegister = myForm.Register.options[myForm.Register.selectedIndex].value;
  var thisFolio = myForm.Folio.options[myForm.Folio.selectedIndex].value;
  var thisVtn = myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value;
  // get index for current transcript info in the "myTS.transcripts" array
  for (var thisIndex = 0; thisIndex < myTS.transcripts.length; thisIndex++) {
    var temp = values(myTS.transcripts[thisIndex]);
    if (temp[0] === thisRegister && temp[1] === thisFolio && temp[2] === thisVtn) {
        break;
    }
  }
  // get previous and next transcripts in the "myTS.transcripts" array
  var prevIndex = thisIndex - 1 >= 0 ? thisIndex - 1 : myTS.transcripts.length - 1;
  var nextIndex = thisIndex + 1 < myTS.transcripts.length ? thisIndex + 1 : 0;
  // get info about previous and next transcripts
  var prevRegister = values(myTS.transcripts[prevIndex])[0];
  var prevFolio = values(myTS.transcripts[prevIndex])[1];
  var prevVtn = values(myTS.transcripts[prevIndex])[2];
  var nextRegister = values(myTS.transcripts[nextIndex])[0];
  var nextFolio = values(myTS.transcripts[nextIndex])[1];
  var nextVtn = values(myTS.transcripts[nextIndex])[2];
  return {
    prev: { register: prevRegister, folio: prevFolio, vtn: prevVtn },
    next: { register: nextRegister, folio: nextFolio, vtn: nextVtn }
  };
};

//3)
// resetRecord helper method: update form display
var setNewSelectionInForm = function(formFieldNode, newValue) {
  for (var i=0; i<formFieldNode.length; i++) {
    if (formFieldNode[i].nodeType === 1 && formFieldNode[i].innerHTML === newValue) {
      formFieldNode[i].selected = true;
    }
  }
};
function resetRecord(newRegister, newFolio, newVtn) {
  myForm.Register.options[myForm.Register.selectedIndex].value = newRegister;
  myForm.Folio.options[myForm.Folio.selectedIndex].value = newFolio;
  myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value = newVtn;
  setlink();
  setNewSelectionInForm(document.getElementById('register'), newRegister);
  setNewSelectionInForm(document.getElementById('Folio'), newFolio);
  setNewSelectionInForm(document.getElementById('Voci_Transcript_Number'), newVtn);
  transcriptionState = setState();
};
