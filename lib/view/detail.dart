import 'package:flutter/material.dart';

class EventDetail extends StatefulWidget {
  final String title;
  final List<Map<String, String>> events;

  const EventDetail({
    super.key,
    required this.title,
    required this.events,
  });

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredEvents = widget.events
        .where((event) =>
            event['title']!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FF),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 48),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, index) {
                    final event = filteredEvents[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue.shade100,
                            child: const Icon(Icons.person, color: Colors.blue),
                          ),
                          title: Text(event['title'] ?? ''),
                          subtitle: Text(event['subtitle'] ?? ''),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 140,
            left: 16,
            right: 16,
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (value) => setState(() => _searchQuery = value),
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
