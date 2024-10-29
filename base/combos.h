/ {
    combos {
        compatible = "zmk,combos";

        combo_updir {
            timeout-ms = <50>;
            key-positions = <RB3 RB4>;
            bindings = <&UPDIR>;
            layers=<0>;
        };

        combo_tab {
            timeout-ms = <50>;
            key-positions = <RT1 RT2>;
            bindings = <&kp TAB>;
            layers=<0>;
        };

        combo_del {
            timeout-ms = <50>;
            key-positions = <RB1 RB2>;
            bindings = <&kp DEL>;
            layers=<0>;
        };

        combo_und {
            timeout-ms = <50>;
            key-positions = <LM1 LM2>;
            bindings = <&kp UNDER>;
            layers=<1>;
        };

        combo_dot {
            timeout-ms = <50>;
            key-positions = <RM1 RM2>;
            bindings = <&kp DOT>;
            layers=<3>;
        };

    };
};