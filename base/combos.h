#ifdef five_column
  #include "keypos_36keys.h"
#else
  #include "keypos_42keys.h"
#endif

/ {
    combos {
        compatible = "zmk,combos";

        combo_updir {
            timeout-ms = <50>;
            key-positions = <RB3 RB4>;
            bindings = <&UPDIR>;
            layers=<0>;
        };

        combo_jetbrains {
            timeout-ms = <50>;
            key-positions = <LB1 RB1>;
            bindings = <&to JETBRAINS>;
            layers=<0>;
        };

    };
};