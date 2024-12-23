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
    };
};