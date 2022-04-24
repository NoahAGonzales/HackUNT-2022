final String tableLeaderboard = 'leaderboard';

class LeaderboardEntryFields {
	static final List<String> values = [
		id, name, location, score
	];
	
	static final String id = '_id';
	static final String name = 'name';
	static final String location = 'location';
	static final String score = 'score';
}

class LeaderboardEntry {
	final int? id;
	final String name;
	final int leaderboardLocation;
	final int personScore;
	
	const LeaderboardEntry({
		this.id,
		required this.name,
		required this.leaderboardLocation,
		required this.personScore,
	});
	
	LeaderboardEntry copy({
		int? id,
		String? name,
		int? location,
		int? score,
		
	}) =>
		LeaderboardEntry(
			id: id ?? this.id,
			name: name ?? this.name,
			leaderboardLocation:  leaderboardLocation, //?? this.leaderboardLocation,
			personScore: personScore,
		);
		
		static LeaderboardEntry fromJson(Map<String, Object?> json) => LeaderboardEntry(
			id: json[LeaderboardEntryFields.id] as int?,
			name: json[LeaderboardEntryFields.name] as String,
			leaderboardLocation: json[LeaderboardEntryFields.location] as int,
			personScore: json[LeaderboardEntryFields.score] as int,
		);
	
	Map<String, Object?> toJson() => {
		LeaderboardEntryFields.id: id,
		LeaderboardEntryFields.name: name,
		LeaderboardEntryFields.location: leaderboardLocation,
		LeaderboardEntryFields.score: personScore,
	};
}