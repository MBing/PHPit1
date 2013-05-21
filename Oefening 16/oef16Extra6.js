        function toonInwoners(stad) {
            stad = stad.toLowerCase();
            var output;
            switch(stad) {
            case 'gent':
                 output = 'Het aantal inwoners van Gent is 25000.';
                 break;
            case 'brussel':
                output = 'Het aantal inwoners van Brussel is 100000.';
                break;
            case 'antwerpen':
                output = 'Het aantal inwoners van Antwerpen is 50000.';
                break;
            default:
                output = 'Het is niet gekend in onze database hoeveel inwoners de opgegeven stad '+stad+' telt.';
            }
            document.write(output);
        }