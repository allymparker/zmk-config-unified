/ {
    combos {
        compatible = "zmk,combos";
        combo_esc {
            timeout-ms = <50>;
            key-positions = <RB3 RB4>;
            bindings = <&UPDIR>;
        };
    };
};