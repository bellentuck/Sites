thisRegister = myForm.Register.options[myForm.Register.selectedIndex].value;
thisFolio = myForm.Folio.options[myForm.Folio.selectedIndex].value;
thisVtn = myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value;

for (thisIndex = 0; thisIndex < myTS.transcripts.length; thisIndex++) {
  var temp = values(myTS.transcripts[thisIndex]);
  if (temp[0] === thisRegister && temp[1] === thisFolio && temp[2] === thisVtn) {
      break;
  }
}

var prev = document.getElementsByClassName('previousBtn');
var next = document.getElementsByClassName('nextBtn');

var prevIndex = thisIndex - 1 >= 0 ? thisIndex - 1 : myTS.transcripts.length - 1;
var nextIndex = thisIndex + 1 < myTS.transcripts.length ? thisIndex + 1 : 0;
var prevRegister = values(myTS.transcripts[prevIndex])[0];
var prevFolio = values(myTS.transcripts[prevIndex])[1];
var prevVtn = values(myTS.transcripts[prevIndex])[2];

prev[0].addEventListener('click', function() {
  myForm.Register.options[myForm.Register.selectedIndex].value = prevRegister;
  myForm.Folio.options[myForm.Folio.selectedIndex].value = prevFolio;
  myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value = prevVtn;
  setlink();
}, false);


next[0].addEventListener('click', function() {
  myForm.Register.options[myForm.Register.selectedIndex].value = values(myTS.transcripts[nextIndex])[0];
  myForm.Folio.options[myForm.Folio.selectedIndex].value = values(myTS.transcripts[nextIndex])[1];
  myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value = values(myTS.transcripts[nextIndex])[2];
  setlink();
}, false);
