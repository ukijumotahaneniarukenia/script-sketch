#!/bin/bash

<<EOF
===============================================================
ERROR_HANDLING_MESSAGE

XXXXXXXX_INFO_MSG
XXXXXXXX_WARN_MSG
XXXXXXXX_ERR_MSG
XXXXXXXX_START_MSG
XXXXXXXX_END_MSG

===============================================================
EOF
NON_ARGS_ERR_MSG=$(cat <<EOF
NON_ARGS_ERR_MSG
NONE ANY ARGS.PLEASE ENTER ARGS WHEN CALL.
$(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9') $(echo -ne '\U1F4A9')
EOF
)

OVER_STRLEN_ERR_MSG=$(cat <<EOF
OVER_STRLEN_ERR_MSG"
INVALED_STRLENGTH. PLEASE ENTER ONLY ONE CHARCTER.
$(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') 
EOF
)

NOTIFY_ERR_MSG=$(cat <<EOF
NOTIFY_ERR_MSG
THERE IS A ERROR.PLEASE CONFIRM.
$(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') $(echo -ne '\U1F47B') 
EOF
)
