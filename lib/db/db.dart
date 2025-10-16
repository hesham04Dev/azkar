import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

/// ----------------------
/// TABLE DEFINITIONS
/// ----------------------

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  IntColumn get iconId => integer().withDefault(const Constant(0))();
  IntColumn get earnedXp => integer().withDefault(const Constant(0))();
  IntColumn get maxXp => integer().withDefault(const Constant(100))();
  IntColumn get level => integer().withDefault(const Constant(1))();
}

class Settings extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().unique()();
  IntColumn get val => integer()();
  @override
  Set<Column<Object>>? get primaryKey => {id};
}


/// Azkar tables
class ZkrCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Zkrs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get content => text()();
}

class ZkrTimes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get zkrId => integer().references(Zkrs, #id)();
  IntColumn get zkrCategoryId => integer().references(ZkrCategories, #id)();
  IntColumn get repeat => integer()();
  IntColumn get rank => integer()();
  TextColumn get description => text().nullable()();
}

/// ----------------------
/// DATABASE
/// ----------------------

@DriftDatabase(
  tables: [
    Categories,
    Settings,
    ZkrCategories,
    Zkrs,
    ZkrTimes,
  ],
  daos: [SettingDao, AzkarDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  static late AppDatabase db;
  static init(){
    db = AppDatabase();
  }
  
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();

          // seed defaults
          await into(settings).insertOnConflictUpdate(
            SettingsCompanion.insert(id: Value(1), name: 'Coins', val: 0),
          );
          await into(settings).insertOnConflictUpdate(
            SettingsCompanion.insert(id: Value(2), name: 'DarkMode', val: 0),
          );
          await into(settings).insertOnConflictUpdate(
            SettingsCompanion.insert(id: Value(3), name: 'AccentColor', val: 0),
          );
          await into(settings).insertOnConflictUpdate(
            SettingsCompanion.insert(id: Value(4), name: 'NotificationTime', val: 0),
          );
          await into(settings).insertOnConflictUpdate(
            SettingsCompanion.insert(id: Value(5), name: 'Streak', val: 1),
          );
          await into(settings).insertOnConflictUpdate(
            SettingsCompanion.insert(id: Value(6), name: 'ListView', val: 0),
          );
          await into(settings).insertOnConflictUpdate(
            SettingsCompanion.insert(id: Value(7), name: 'LanguageId', val: 0),
          );
          await into(settings).insertOnConflictUpdate(
            SettingsCompanion.insert(id: Value(8), name: 'EasterEggs', val: 0),
          );
          await into(settings).insertOnConflictUpdate(
            SettingsCompanion.insert(id: Value(9), name: 'DBVersion', val: 1),
          );

          await into(categories).insertOnConflictUpdate(
            CategoriesCompanion.insert(name: 'main'),
          );
        },
        onUpgrade: (m, from, to) async {
          if (from == 1 && to == 2) {
          }
        },
      );
 


}

LazyDatabase _openConnection() {
  // return LazyDatabase(() async {
  //   final dir = await getApplicationSupportDirectory();
  //   final file = File(p.join(dir.path, 'hcody_ab.db'));
  //   return NativeDatabase.createInBackground(file);
  // });

  return LazyDatabase(() async {
    final dir = await getApplicationSupportDirectory();
    final dbFile = File(p.join(dir.path, 'hcody_ab.db'));
    print(dbFile.path);
    // Copy DB from assets if it doesn't exist
    await dbFile.delete();
    if (!await dbFile.exists()) {
      // print("dddddddddd");
      final data = await rootBundle.load('assets/al_azkar_db11.db');
      final bytes = data.buffer.asUint8List();
      await dbFile.writeAsBytes(bytes);
      print(dbFile.path);
    }else{
      // dbFile.delete();
    }

    return NativeDatabase(dbFile);
  });
}

/// ----------------------
/// SETTING DAO
/// ----------------------

@DriftAccessor(tables: [Settings])
class SettingDao extends DatabaseAccessor<AppDatabase> with _$SettingDaoMixin {
  final AppDatabase db;
  SettingDao(this.db) : super(db);

  Future<void> updateStreak() async {
    final lastDay = await _getLastDay();
    final now = DateTime.now();
    final diff = lastDay == null ? 0 : now.difference(lastDay).inDays;

    if (diff == 1) {
      await customStatement(
        "UPDATE setting SET Val = Val + 1 WHERE Name = 'Streak'",
      );
    } else if (diff != 0) {
      await (update(db.settings)..where((s) => s.name.equals('Streak')))
          .write(const SettingsCompanion(val: Value(1)));
    }
  }

  Future<int> getStreak() async {
    final row = await (select(db.settings)
          ..where((s) => s.name.equals('Streak')))
        .getSingle();
    return row.val;
  }

  Future<DateTime?> _getLastDay() async {
    // TODO
  }

  Future<int> getAccentColorIndex() async {
    final row = await (select(db.settings)
          ..where((s) => s.name.equals('AccentColor')))
        .getSingle();
    return row.val;
  }

  Future<void> setAccentColor(int val) async {
    await (update(db.settings)..where((s) => s.name.equals('AccentColor')))
        .write(SettingsCompanion(val: Value(val)));
  }

  Future<bool> getDarkMode() async {
    final row = await (select(db.settings)
          ..where((s) => s.name.equals('DarkMode')))
        .getSingle();
    return row.val == 1;
  }

  Future<void> setDarkMode(bool val) async {
    await (update(db.settings)..where((s) => s.name.equals('DarkMode')))
        .write(SettingsCompanion(val: Value(val ? 1 : 0)));
  }

  Future<bool> isListView() async {
    final row = await (select(db.settings)
          ..where((s) => s.name.equals('ListView')))
        .getSingle();
    return row.val == 1;
  }

  Future<void> setIsListView(bool val) async {
    await (update(db.settings)..where((s) => s.name.equals('ListView')))
        .write(SettingsCompanion(val: Value(val ? 1 : 0)));
  }

  Future<int> getNotificationTime() async {
    final row = await (select(db.settings)
          ..where((s) => s.name.equals('NotificationTime')))
        .getSingle();
    return row.val;
  }

  Future<void> setNotificationTime(int val) async {
    await (update(db.settings)..where((s) => s.name.equals('NotificationTime')))
        .write(SettingsCompanion(val: Value(val)));
  }

  Future<int> getEasterEggs() async {
    final row = await (select(db.settings)
          ..where((s) => s.name.equals('EasterEggs')))
        .getSingle();
    return row.val;
  }

  Future<void> foundEasterEggs() async {
    await customStatement(
      "UPDATE setting set Val = Val + 1 WHERE Name = 'EasterepeatrEggs'",
    );
  }

  Future<int> getDBVersion() async {
    final row = await (select(db.settings)
          ..where((s) => s.name.equals('DBVersion')))
        .getSingle();
    return row.val;
  }

  Future<void> setDBVersionToLatest(int kDBVersion) async {
    await (update(db.settings)..where((s) => s.name.equals('DBVersion')))
        .write(SettingsCompanion(val: Value(kDBVersion)));
  }
}

/// ----------------------
/// AZKAR DAO
/// ----------------------

@DriftAccessor(tables: [ZkrCategories, Zkrs, ZkrTimes])
class AzkarDao extends DatabaseAccessor<AppDatabase> with _$AzkarDaoMixin {
  final AppDatabase db;
  AzkarDao(this.db) : super(db);

  Future<List<ZkrCategory>> getAzkarCategories() =>
      select(db.zkrCategories).get();

  Future<List<Map<String, dynamic>>> getAzkarByCategoryId(int id) async {
    final query = await (select(db.zkrs).join([
      innerJoin(db.zkrTimes, db.zkrTimes.zkrId.equalsExp(db.zkrs.id)),
    ])
      ..where(db.zkrTimes.zkrCategoryId.equals(id))
      ..orderBy([
        OrderingTerm(expression: db.zkrTimes.rank, mode: OrderingMode.asc),
      ]
      )
    ).get();

    return query.map((row) {
      final zkr = row.readTable(db.zkrs);
      final time = row.readTable(db.zkrTimes);
      return {
        "id": zkr.id,
        "content": zkr.content,
        "repeat": time.repeat,
        "name" : zkr.name,
        "rank": time.rank,
        "description": time.description,
        "zkr_category_id": time.zkrCategoryId
      };
    }).toList();
  }

  Future<void> updateRanks(List<Map<String,dynamic>> azkars) async {
    print("text");
    print(azkars.first["id"]);
    for (var zkr in azkars) {
      await (update(db.zkrTimes)..where((zkrTime) => zkrTime.zkrId.equals(zkr["id"]!)  & zkrTime.zkrCategoryId.equals(zkr["zkr_category_id"])))
          .write(ZkrTimesCompanion(rank: Value(zkr["rank"]??0)));
    }
    // if (diff == 1) {
    //   await customStatement(
    //     "UPDATE setting SET Val = Val + 1 WHERE Name = 'Streak'",
    //   );
    // } else if (diff != 0) {
    //   await (update(db.settings)..where((s) => s.name.equals('Streak')))
    //       .write(const SettingsCompanion(val: Value(1)));
    // }
  }
}
