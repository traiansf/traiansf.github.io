window.onload = init;
var x, y, z, x_minus_z, cifre_suma;

function get(id) {
    return document.getElementById(id);
}

function show(id) {
    get(id).style.display = "block";
}

function hide(id) {
    get(id).style.display = "none";
}

function init() {
    show("p0");
    get('b0').onclick = b0Click;
    get('b1').onclick = b1Click;
    get('b2').onclick = b2Click;
    get('b3').onclick = b3Click;
    get('b4').onclick = b4Click;
    get('b4_3').onclick = b4_3Click;
    get('b5').onclick = b5Click;
    get('b6').onclick = b6Click;
    get('b6_4').onclick = b6_4Click;
}

function b0Click() {
    hide('b0');
    show('p1');
}

function b1Click() {
    hide('b1');
    show('p2');
}

function b2Click() {
    hide('b2');
    show('p3');
}

function b3Click() {
    hide('b3');
    show('p4');
}

function b4Click() {
    hide('b4');
    cifre_diferenta = get('cifre-diferenta').value;
    if (cifre_diferenta == 3) {
        show('p4_3');
    } else {
        show('p5');
        if (cifre_diferenta == 1) {
            x_minus_z = 0;
        } else {
            x_minus_z = 1;
        }
    }
}

function b4_3Click() {
    hide('b4_3');
    show('p5');
    x_minus_z = 1 + Number(get('prima-cifra-diferenta').value);
}

function b5Click() {
    hide('b5');
    show('p6');
}

function b6Click() {
    hide('b6');
    cifre_suma = get('cifre-suma').value;
    show('p6_2');
    if (cifre_suma == 3) {
        show('p6_1');
    } else {
        show('p6_3');
    }
    show('p6_4');
}

function impar(n) {
    return n % 2;
}

function b6_4Click() {
    hide('p6_4');
    var aproape_x_plus_z, aproape_2_y;
    if (cifre_suma == 3) {
        aproape_x_plus_z = Number(get('prima-cifra-suma').value);
        aproape_2_y = Number(get('a-doua-cifra-suma').value);
    } else {
        aproape_x_plus_z = 10 + Number(get('a-doua-cifra-suma').value);
        aproape_2_y = Number(get('a-treia-cifra-suma').value);
    }
    aproape_2_x = x_minus_z + aproape_x_plus_z;
    x = Math.floor(aproape_2_x / 2);
    z = x - x_minus_z;
    y = Math.floor(aproape_2_y / 2);
    if (impar(aproape_2_x)) {
        y = 5 + y;
    }

    get('numar').innerText = x.toString() + y.toString() + z.toString();
    show('p7');
}
