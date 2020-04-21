# FEC-NiDSC
Forward Error Correction - symulacja i analiza 

Obsługa programu:

n_bit - ilość bitów przesyłanej wiadomości (sekcja GENERATOR)

m, k - parametry kodowania bch (sekcja bch encoding, domyślnie n = 15, k = 5)

Wybór kodowania - należy odkomentować wybrany sposób (sekcja choosing what coding we want to use to transport bits)

Wybór kanału - należy odkomentować wybrany kanał (sekcja BSC i Gilbert model)

BSC:

probability - prawdopodobieństwo wystąpienia błędu przy transmisji BSC

GILBERT:

goodtobad - prawdopodobieństwo przejścia ze stanu dobrego do złego
badtogood - prawdopodobieństwo przejścia ze stanu dobrego do złego
errorwhengood - prawdopodobieństwo błędu, gdy w stanie dobrym
errorwhenbad - prawdopodobieństwo błędu, gdy w stanie złym

Dekodowanie - należy odkomentować odpowiedni do wcześniej zakodowanej wiadomości sposób dekodowania (sekcja DECODING)

Podczas działania programu jedynie jedna kombinacja kodowania i dekodowania powinna być odkomentowana - reszta powinna być zakomentowana aby symulacja została wykonana poprawnie

UWAGA - w przypadku korzystania z kodu bch ORAZ kanału Gilberta należy odkodować dodatkowe części kodu - wynika to z potrzeby transformacji zakodowanej macierzy bch do transmisji oraz po transmisji do odkodowania

Program po włączeniu w odpowiedniej konfiguracji zwraca BER oraz nadmierność kodu.
