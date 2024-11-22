import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:sqflite/sqflite.dart';

import '../features/home/data/news_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;
  final _databaseName = 'news.db';
  final _databaseVersion = 1;

  // Singleton pattern
  DatabaseHelper._();

  static DatabaseHelper get instance {
    _instance ??= DatabaseHelper._();
    return _instance!;
  }

  // Database getter with initialization check
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  Future<Database> _initDatabase() async {
    try {
      return await openDatabase(
        _databaseName,
        version: _databaseVersion,
        onCreate: _onCreate,
        onOpen: (db) async {
          debugPrint('Database opened');
          BlocListener<HomeCubit, HomeState>(
            listener: (context, state){
              var cubit = HomeCubit.get(context);
              cubit.loadArticles();
            },

          );
        },
      );
    } catch (e) {
      debugPrint('Database initialization error: $e');
      rethrow;
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE articles(
          id INTEGER PRIMARY KEY, 
          articleId TEXT, 
          title TEXT, 
          link TEXT,
          description TEXT, 
          content TEXT, 
          pubDate TEXT, 
          pubDateTz TEXT, 
          imageUrl TEXT, 
          sourceId TEXT, 
          sourceName TEXT, 
          sourceUrl TEXT,
          sourceIcon TEXT, 
          language TEXT, 
          country TEXT, 
          category TEXT
        )
      ''');
      debugPrint('Table created successfully');
    } catch (e) {
      debugPrint('Table creation error: $e');
      rethrow;
    }
  }

  Future<void> insertArticle(Results model) async {
    try {
      final db = await database;
      await db.transaction((txn) async {
        await txn.rawInsert(
          '''INSERT INTO articles (
            articleId, title, link, description, content, 
            pubDate, pubDateTZ, imageUrl, sourceId, sourceName,
            sourceUrl, sourceIcon, language, country, category
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''',
          [
            model.articleId,
            model.title,
            model.link,
            model.description,
            model.content,
            model.pubDate,
            model.pubDateTZ,
            model.imageUrl,
            model.sourceId,
            model.sourceName,
            model.sourceUrl,
            model.sourceIcon,
            model.language,
            model.country?.first ?? '',
            model.category?.first ?? 'other',
          ],
        );
      });
    } catch (e) {
      debugPrint('Insert error: $e');
      rethrow;
    }
  }

  Future<List<Results>> getArticles() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('articles');
      return List.generate(maps.length, (i) => Results.fromMap(maps[i]));
    } catch (e) {
      debugPrint('Get articles error: $e');
      rethrow;
    }
  }

  Future<void> deleteArticle(String articleId) async {
    try {
      final db = await database;
      await db.rawDelete(
        'DELETE FROM articles WHERE articleId = ?',[articleId],
      );
    } catch (e) {
      debugPrint('Delete error: $e');
      rethrow;
    }
  }
}