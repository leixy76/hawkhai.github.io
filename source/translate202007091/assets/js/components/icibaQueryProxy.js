define(function(){return function(e){if(e&&(e.word_name&&e.symbols&&e.symbols.length||e.net_means)){var n=[],t=!!e.exchange;if(e.symbols&&e.symbols.length&&(n=e.symbols.map(function(e){var n={ph_am:{text:e.ph_am,sound:e.ph_am_mp3&&".mp3"===e.ph_am_mp3.slice(-4)?e.ph_am_mp3:e.ph_tts_mp3&&".mp3"===e.ph_tts_mp3.slice(-4)?e.ph_tts_mp3:""},ph_en:{text:e.ph_en,sound:e.ph_en_mp3&&".mp3"===e.ph_en_mp3.slice(-4)?e.ph_en_mp3:""}};return(e.ph_am||e.ph_en)&&(t=!0),{pronounces:n,parts:e.parts&&e.parts.map?e.parts.map(function(e){var n=e.part||null;return n&&(t=!0),{part:n,means:e.means&&e.means.map(function(e){return"string"==typeof e&&e?(t=!0,e):"string"==typeof e.word_mean&&e.word_mean?(t=!0,e.word_mean):void 0})||[]}}):[]}})),e.net_means)try{var p=e.net_means;p.PerfectNetExp&&p.PerfectNetExp.length&&n.push({net_means:p.PerfectNetExp.map(function(e){var n=e.exp||null;if(n)return t=!0,n})})}catch(e){}return t?{exchange:e.exchange,symbols:n}:void 0}}});
