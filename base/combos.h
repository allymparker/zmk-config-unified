/ {
    combos {
        compatible = "zmk,combos";
        combo_esc {
            timeout-ms = <50>;
            key-positions = <RB3 RB4>;
            bindings = <&UPDIR>;
            layers=<0>;
        };

        combo_pml {
            timeout-ms = <50>;
            key-positions = <LB3 LB4>;
            bindings = <&PML>;
            layers=<0>;
        };

    };
};