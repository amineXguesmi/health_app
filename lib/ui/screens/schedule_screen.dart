import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../core/models/data_meeting.dart';
import '../../core/models/meeting.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Meeting> _getDataSource() {
      List<Meeting> meetings = <Meeting>[];
      DateTime today = DateTime.now();
      DateTime startTime = DateTime(today.year, today.month, today.day, 10, 0, 0);
      DateTime endTime = startTime.add(const Duration(hours: 2));
      meetings.add(Meeting('visit1', startTime, endTime, const Color(0xFF0F8644), false));
      startTime = DateTime(today.year, today.month, 23, 12, 0, 0);
      meetings.add(Meeting('visit2', startTime, endTime, const Color(0xFF0F8644), false));
      startTime = DateTime(today.year, today.month, 28, 8, 0, 0);
      meetings.add(Meeting('visit3', startTime, endTime, const Color(0xFF0F8644), false));
      return meetings;
    }

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: deviceHeight * 0.1,
          ),
          Text(
            "Scedule for this month",
            style: TextStyle(
              color: Colors.black,
              fontSize: deviceWidth * 0.06,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.04,
          ),
          SizedBox(
            width: deviceWidth,
            height: deviceHeight * 0.7,
            child: SfCalendar(
              view: CalendarView.month,
              headerStyle: CalendarHeaderStyle(
                  textStyle: TextStyle(
                fontSize: deviceWidth * 0.06,
                fontWeight: FontWeight.w500,
              )),
              dataSource: MeetingDataSource(_getDataSource()),
              monthViewSettings: MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                agendaStyle: AgendaStyle(
                  dateTextStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: deviceWidth * 0.06,
                  ),
                  appointmentTextStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: deviceWidth * 0.08, color: Colors.blueGrey),
                ),
                agendaViewHeight: deviceWidth * 0.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
