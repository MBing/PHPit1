/* Oefening 29-3 Javascript */

var lotto = (function(){

	// Used array for random and selected numbers
	var numbers = new Array();
	var selected = new Array();
	var dupeChecker = new Array();
	
	
	for(var z = 1; z<=42; z++) { dupeChecker.push(z);}
	var arrBackup = dupeChecker.concat();
	
	// Date variable
	var date = new Date();
	
	// Number of rows and columns for the table-building function
	var parCol = 6;		
	var parRow = 7;
	
	// random number variable and counter to determine max number of cells
	var randomNr;
	var tableCounter;		
	
	// Converting the date variable to a shorter string (dd-mm-yyyy)
	date = date.toLocaleDateString();
	
	return{
		'pull' :	function()
			{				
			// Loop that clears previous pulled numbers, except chosen numbers in orange.
				for (var y=1; y<tableCounter; y++)
				{
					if(document.getElementById('td'+ y).className == 'pulled')
					{
						document.getElementById('td'+ y).className = 'empty';
					}
					
					if(document.getElementById('td'+ y).className == 'winning')
					{
						document.getElementById('td'+ y).className = 'selected';
					}
				}
			
			// Clean array to make room for the next 'lottery'
				numbers = [];
				
			// Main loop to get 7 numbers	
				for(var i=0; i<7; i++)
				{	
				// Repopulate original array
					if(dupeChecker.length == 0 || dupeChecker === null)
					{
						dupeChecker = arrBackup.concat();
					}
					
					randomNr = Number(Math.floor(Math.random()*(dupeChecker.length)));
					
				// Selecting numbers based on keys in the dupeChecker array					
					numbers[i] = dupeChecker[randomNr];
					dupeChecker.splice(randomNr,1);
					
				// First six numbers are to be shown in the table, 7th is a backup number. Also changes colors on selected numbers.
				 
					if(i != 6)
					{
						if(document.getElementById('td' + numbers[i]).className == 'selected')
						{
							document.getElementById('td' + numbers[i]).className = 'winning';
						}
						else
						{
							document.getElementById('td' + numbers[i]).className = 'pulled';
						}
					}
					else
					{
						document.getElementById('reservegetal').innerHTML = numbers[i];
					}
					
					
				}	

			// Show the current date
				document.getElementById('date').innerHTML = 'Lottotrekking van ' + date;
				
			// check array for winning numbers	
				lotto.won(numbers);				
			}
			
	// function to check winning numbers
		,'won' : function(array)
			{
				var winCounter = 0;
				var aLength = array.length;
			// Double ? for-loop to compare all keys within both arrays	
				for (var i = 0 ; i <= aLength ; i++)
				{
						if((array[i] in selected) && (selected.length === aLength))
						{
							winCounter++;
						}
				}
				console.log(winCounter);
				
			// Determine the amount of correct numbers	
			var win;
				switch(winCounter)
				{	
					case 0:
						win = 'U heeft niets gewonnen';
						break;
						
					case 1:
						win = 'U heeft 5 euro gewonnen!!';
						break;
						
					case 2:
						win = 'U heeft 10 euro gewonnen!!';
						break;
						
					case 3:
						win = 'U heeft 25 euro gewonnen!!';
						break;
						
					case 4:
						win = 'U heeft 100 euro gewonnen!!';
						break;
						
					case 5:
						win = 'U heeft 1.000 euro gewonnen!!';
						break;
					
					case 6:
						win = 'U heeft 2.500 euro gewonnen!!';
						break;
						
					case 7:
						win = 'U heeft 10.000 euro gewonnen!!';
						break;
				}
				console.log(win);
				winCounter = 0;
			}
			
	// Table-building function
		,'table' :	function()
			{
				var dump = '<table>';
				tableCounter = 1;
            
				for(var i = 1; i < (parRow+1); i++)
				{
					dump += '<tr>';
			  
					for (var j = 1; j < (parCol+1); j++)
					{
						dump += '<td id="td'+ tableCounter + '" onclick="lotto.add(this)">' + tableCounter + '</td>';
						tableCounter++;
					}
			   		dump += '</tr>';
				}
				dump += '</table>';
				document.getElementById('tablewrap').innerHTML = dump;
				
			}
			
	// Function for the user to select 7 numbers and put them in an array
		,'add'	:	function(target)
			{
				var select = Number(target.innerHTML);
				var arrLength = selected.length;
				
				if(arrLength < 7)
				{
					selected.push(select);
					target.className = 'selected';
				}
				else
				{
					alert('U heeft het maximaal aantal getallen geselecteerd.');
				}
				console.log(selected);
			}
	
	// Function to clear the board and the array of selected numbers
		,'cleanup':	function()
			{
				selected = [];
				for (var y=1; y<tableCounter; y++)
				{
					document.getElementById('td'+ y).className = 'empty';
				}				
			}
	}
}());