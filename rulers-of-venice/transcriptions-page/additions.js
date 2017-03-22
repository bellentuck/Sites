// insert at end of setlink() in app.js:
var frag = document.createDocumentFragment();
var navBtns = document.createElement("div");
navBtns.innerHTML = '<p id="columnsQuickSelect">
				<a class="previousBtn" href="#">Previous transcription</a>
				<a class="nextBtn" href="#">Next transcription</a>
			</p>';
frag.appendChild(navBtns);
document.form.appendChild(frag);



//insert at the end of app.js:

var thisRegister = myForm.Register.options[myForm.Register.selectedIndex].value;
var thisFolio = myForm.Folio.options[myForm.Folio.selectedIndex].value;
var thisVtn = myForm.Voci_Transcript_Number.options[myForm.Voci_Transcript_Number.selectedIndex].value;
var thisImage = k;

var thisIndex = myTS.transcripts.indexOf({  "register": thisRegister, "folio": thisFolio, "vtn": thisVtn, "image": thisImage });
var prevIndex = thisIndex - 1 >= 0 ? thisIndex - 1 : myTS.transcripts.length - 1;
var nextIndex = thisIndex + 1 < myTS.transcripts.length ? thisIndex + 1 : 0;

var prev = document.getElementsByClassName('previousBtn');
var next = document.getElementsByClassName('nextBtn');

prev.addEventListener('click', function() {
  thisRegister = myTS.transcripts[prevIndex].register;
  thisFolio = myTS.transcripts[prevIndex].folio;
  thisVtn = myTS.transcripts[prevIndex].vtn;
  thisImage = myTS.transcripts[prevIndex].image;
  setlink();
}, false);

next.addEventListener('click', function() {
  thisRegister = myTS.transcripts[nextIndex].register;
  thisFolio = myTS.transcripts[nextIndex].folio;
  thisVtn = myTS.transcripts[nextIndex].vtn;
  thisImage = myTS.transcripts[nextIndex].image;
  setlink();
}, false);
