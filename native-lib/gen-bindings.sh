#!/bin/bash
RUST_BACKTRACE=1 ~/.cargo/bin/flutter_rust_bridge_codegen -r native-lib/src/api.rs -d lib/bridge_generated.dart --dart-decl-output lib/bridge_definitions.dart 