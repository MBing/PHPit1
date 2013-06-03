var toonCursist = (function() {
    var cursisten = ['Pascal', 'Bram', 'Davey', 'Jan', 'Sang', 'Maarten', 'Sarah', 'Sara', 'Danny', 'Suzan', 'Astrid', 'Ismaël'];
    var cursist = document.getElementById('cursist');
    var lenCur = cursisten.length;
    var num, name;
    var cpCursisten = cursisten.slice(0); //zorgt ervoor dat beide waarden onafhankelijk zijn van elkaar bij wijzigingen
    return function() {
            if(lenCur === 0) {
                lenCur = cursisten.length;
            }
            num = Math.ceil(Math.random()*lenCur -1);
            lenCur -= 1;
            
            if (cpCursisten.length === 0) {
            cpCursisten = cursisten.slice(0); //een nieuwe kloon van deze array maken via slice(0)
            }
            
            name = cpCursisten[num];
            cpCursisten.splice(num,1); 

        return cursist.innerHTML = name;
    }
}());

