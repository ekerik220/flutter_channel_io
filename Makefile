pigeon_generate:
	flutter pub run pigeon \
	--input pigeons/channel_io_interface.dart \
	--dart_out lib/channel_io_interface.dart \
	--objc_header_out ios/Classes/channel_io_interface.h \
	--objc_source_out ios/Classes/channel_io_interface.m