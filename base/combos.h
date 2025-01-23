/ {
    combos {
        compatible = "zmk,combos";

        combo_updir {
            timeout-ms = <50>;
            key-positions = <RB3 RB4>;
            bindings = <&UPDIR>;
            layers=<0>;
        };

        combo_screenshot {
            timeout-ms = <50>;
            key-positions = <RM3 RM4>;
            bindings = <&MC_PSC>;
            layers=<0>;
        };

        combo_volup {
            timeout-ms = <50>;
            key-positions = <LT3 LT4>;
            bindings = <&CVUP>;
            layers=<0>;
        };

        combo_pp {
            timeout-ms = <50>;
            key-positions = <LM3 LM4>;
            bindings = <&CPP>;
            layers=<0>;
        };

        combo_voldown {
            timeout-ms = <50>;
            key-positions = <LB3 LB4>;
            bindings = <&CVDN>;
            layers=<0>;
        };

        combo_jetbrains {
            timeout-ms = <50>;
            key-positions = <LB1 RB1>;
            bindings = <&sl JETBRAINS>;
            layers=<0>;
        };

        combo_flash_L {
            timeout-ms = <50>;
            key-positions = <LT0 LT4>;
            bindings = <&FLASH>;
            layers=<0>;
        };

        combo_flash_R {
            timeout-ms = <50>;
            key-positions = <RT0 RT4>;
            bindings = <&FLASH>;
            layers=<0>;
        };

    };
};