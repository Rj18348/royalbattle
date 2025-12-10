import 'package:flutter/material.dart';

class ChampionsScreen extends StatelessWidget {
  const ChampionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '🎖️ RoyalBattle Empire Top Champions',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 10, // Number of top champions
        itemBuilder: (context, index) {
          int rank = index + 1;
          return ChampionCard(rank: rank);
        },
      ),
    );
  }
}

class ChampionCard extends StatefulWidget {
  final int rank;

  const ChampionCard({super.key, required this.rank});

  @override
  ChampionCardState createState() => ChampionCardState();
}

class ChampionCardState extends State<ChampionCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isTopThree = widget.rank <= 3;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: isTopThree ? _animation.value : 1.0,
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Color(0xFF001122),
            elevation: isTopThree ? 20 : 10,
            shadowColor: Colors.amber,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.amber,
                  width: isTopThree ? 3 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isTopThree
                        ? Color.fromRGBO(255, 193, 7, 0.6)
                        : Color.fromRGBO(255, 193, 7, 0.3),
                    blurRadius: isTopThree ? 20 : 10,
                    spreadRadius: isTopThree ? 5 : 2,
                  ),
                ],
                // Royal Flag Pattern Background
                gradient: LinearGradient(
                  colors: [Color(0xFF001122), Color(0xFF002244)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Rank Badge
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '#${widget.rank}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Profile Photo with Golden Frame
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.amber, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(255, 193, 7, 0.5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Container(
                          color:
                              Colors.grey[400], // Placeholder for profile photo
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Champion Name
                    Text(
                      'Champion ${widget.rank}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Legendary Badge
                    if (widget.rank == 1)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.purple[900],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.amber, width: 2),
                        ),
                        child: Text(
                          '🏆 Legendary Badge',
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    SizedBox(height: 16),
                    // Stats Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatColumn(
                          icon: Icons.star,
                          value: 'Rank ${widget.rank}',
                          label: 'Champion Rank',
                        ),
                        StatColumn(
                          icon: Icons.trending_up,
                          value: '${500 - widget.rank * 30}',
                          label: 'Best Kill Record',
                        ),
                        StatColumn(
                          icon: Icons.celebration,
                          value: widget.rank == 1
                              ? 'MVP'
                              : 'Top ${widget.rank}',
                          label: widget.rank == 1
                              ? 'Season MVP'
                              : 'Season Rank',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StatColumn extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatColumn({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.amber, size: 24),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey[400], fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
