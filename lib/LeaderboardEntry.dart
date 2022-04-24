final String tableLeaderboard = 'leaderboard';

class LeaderboardEntryFields {
	static final List<String> values = [
		id, name, location
	];
	
	static final String id = '_id';
	static final String name = 'name';
	static final String location = 'location';
}

class LeaderboardEntry {
	final int? id;
	final String name;
	final int leaderboardLocation;
	
	const LeaderboardEntry({
		this.id,
		required this.name,
		required this.leaderboardLocation
	});
	
	LeaderboardEntry copy({
		int? id,
		String? name,
		int? location
		
	}) =>
		LeaderboardEntry(
			id: id ?? this.id,
			name: name ?? this.name,
			leaderboardLocation: leaderboardLocation //?? this.leaderboardLocation,
		);
		
		static LeaderboardEntry fromJson(Map<String, Object?> json) => LeaderboardEntry(
			id: json[LeaderboardEntryFields.id] as int?,
			name: json[LeaderboardEntryFields.name] as String,
			leaderboardLocation: json[LeaderboardEntryFields.location] as int,
			
		);
	
	Map<String, Object?> toJson() => {
		LeaderboardEntryFields.id: id,
		LeaderboardEntryFields.name: name,
		LeaderboardEntryFields.location: leaderboardLocation
	};
}