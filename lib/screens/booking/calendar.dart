import 'dart:io';
import 'dart:ui' as ui; // Import ui untuk RenderRepaintBoundary
import 'dart:typed_data'; // Import untuk ByteData
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studiosnap/components/spbutton.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime today = DateTime.now();
  TimeOfDay? selectedTime;
  GlobalKey _qrKey = GlobalKey();

  void _clickkalender(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
    _selectTime(context);
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> _saveQrCode() async {
    try {
      RenderRepaintBoundary boundary =
          _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final buffer = byteData!.buffer.asUint8List();

      final directory = (await getApplicationDocumentsDirectory()).path;
      final imgFile = File('$directory/qr_code.png');
      await imgFile.writeAsBytes(buffer);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('QR Code saved to $directory/qr_code.png')),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Silahkan Pilih Waktu Booking",
                style: GoogleFonts.jost(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.24,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                child: TableCalendar(
                  focusedDay: today,
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2025, 03, 09),
                  onDaySelected: _clickkalender,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: GoogleFonts.jost(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    leftChevronIcon:
                        Icon(Icons.chevron_left, color: Colors.black87),
                    rightChevronIcon:
                        Icon(Icons.chevron_right, color: Colors.black87),
                  ),
                  calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Color(0xFF191716),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF0404B2),
                        shape: BoxShape.circle,
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: GoogleFonts.jost(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      defaultTextStyle: GoogleFonts.jost(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      disabledTextStyle: GoogleFonts.jost(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      )),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  enabledDayPredicate: (day) {
                    return day.weekday != DateTime.saturday &&
                        day.weekday != DateTime.sunday;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black26, width: 2),
                  ),
                ),
              ),
              if (selectedTime != null) ...[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(color: Color(0xFF0404B2)),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Scan Qr Code",
                            style: GoogleFonts.jost(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                          Text(
                            "Serahkan Qr Code ini kepada studio kami",
                            style: GoogleFonts.jost(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      RepaintBoundary(
                        key: _qrKey,
                        child: QrImageView(
                          data:
                              "Tanggal:\t ${today.toString().split(" ")[0]}, \n Waktu:\t ${selectedTime!.format(context)}\n Status telah terbooking",
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Waktu Booking:",
                              style: GoogleFonts.jost(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            Text(
                              "${today.toString().split(" ")[0]}",
                              style: GoogleFonts.jost(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Jam Booking:",
                              style: GoogleFonts.jost(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            Text(
                              "${selectedTime!.format(context)}",
                              style: GoogleFonts.jost(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SPButton(text: "Simpan Qr Code", onPressed: _saveQrCode)
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}