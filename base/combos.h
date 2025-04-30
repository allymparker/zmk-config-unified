/ {
    combos {
        compatible = "zmk,combos";

        combo_updir {
            timeout-ms = <50>;
            key-positions = <RB3 RB4>;
            bindings = <&UPDIR>;
            layers=<BASE>;
        };

        combo_zoom_in {
            timeout-ms = <50>;
            key-positions = <RT3 RT4>;
            bindings = <&MC_ZIN>;
            layers=<BASE>;
        };

        combo_screenshot {
            timeout-ms = <50>;
            key-positions = <RM3 RM4>;
            bindings = <&MC_PSC>;
            layers=<BASE>;
        };

        combo_zoom_out {
            timeout-ms = <50>;
            key-positions = <RT2 RT3>;
            bindings = <&MC_ZOT>;
            layers=<BASE>;
        };

        combo_volup {
            timeout-ms = <50>;
            key-positions = <LT3 LT4>;
            bindings = <&CVUP>;
            layers=<BASE>;
        };

        combo_pp {
            timeout-ms = <50>;
            key-positions = <LT2 LT3>;
            bindings = <&CPP>;
            layers=<BASE>;
        };

        combo_voldown {
            timeout-ms = <50>;
            key-positions = <LB3 LB4>;
            bindings = <&CVDN>;
            layers=<BASE>;
        };

        combo_next {
            timeout-ms = <50>;
            key-positions = <LT3 LT4>;
            bindings = <&CNXT>;
            layers=<NAV>;
        };
        
        combo_prev {
            timeout-ms = <50>;
            key-positions = <LB3 LB4>;
            bindings = <&CPRV>;
            layers=<NAV>;
        };

        combo_jetbrains {
            timeout-ms = <50>;
            key-positions = <LB1 RB1>;
            bindings = <&sl JETBRAINS>;
            layers=<BASE>;
        };

    };
};