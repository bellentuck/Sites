
//0)
var setState = function() {
  // get current transcript info (register, folio, vtn)
  var thisRegister = myForm.Register.options[myForm.Register.selectedIndex].value;
  var thisFolio = myForm.Folio.options[myForm.Folio.selectedIndex].value;
  var thisVtn = myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value;
  // get index for current transcript info in the "myTS.transcripts" array
  for (var thisIndex = 0; thisIndex < myTS.transcripts.length; thisIndex++) {
    if (myTS.transcripts[thisIndex].register === thisRegister
        && myTS.transcripts[thisIndex].folio === thisFolio
        && myTS.transcripts[thisIndex].vtn === thisVtn) {
        break;
    }
  }
  // get previous and next transcripts in the "myTS.transcripts" array
  var prevIndex = thisIndex - 1 >= 0 ? thisIndex - 1 : myTS.transcripts.length - 1;
  var nextIndex = thisIndex + 1 < myTS.transcripts.length ? thisIndex + 1 : 0;
  // get info about previous and next transcripts
  var prevRegister = myTS.transcripts[prevIndex].register;
  var prevFolio = myTS.transcripts[prevIndex].folio;
  var prevVtn = myTS.transcripts[prevIndex].vtn;
  var nextRegister = myTS.transcripts[nextIndex].register;
  var nextFolio = myTS.transcripts[nextIndex].folio;
  var nextVtn = myTS.transcripts[nextIndex].vtn;
  return {
    prev: { register: prevRegister, folio: prevFolio, vtn: prevVtn },
    next: { register: nextRegister, folio: nextFolio, vtn: nextVtn }
  };
};

//1) to be called @ top of setlink()?
var transcriptionState = setState();

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
};

//3) to be called @ top of setlink()
getButtons();

//4)
var setNewSelectionInForm = function(formFieldNode, newValue) {
  for (var i=0; i<formFieldNode.length; i++) {
    // if (formFieldNode[i].nodeType === 1 && formFieldNode[i].outerHTML === '"<option value="'+newValue+'">'+newValue+'</option>"') {
    //   formFieldNode[i].selected = true;
    // }
    if (formFieldNode[i].nodeType === 1 && formFieldNode[i].value === newValue && formFieldNode[i].innerHTML === newValue) {
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
