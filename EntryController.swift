//
//  EntryController.swift
//  Journal
//
//  Created by Habib Miranda on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let entryKey = "entry"
    
    static let sharedInstance = EntryController() //This is a singleton
    
    var entries = [Entry]()
    
    init() {
        loadFromPersistentStore()
    }
    
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry){
        guard let indexOfEntry = entries.indexOf(entry) else {
        return
        }
        entries.removeAtIndex(indexOfEntry)
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(entries.map({$0.dictionaryCopy}), forKey: entryKey)
    }
    
    func loadFromPersistentStore() {
        guard let entryDictionary = NSUserDefaults.standardUserDefaults().objectForKey(entryKey) as? [[String: AnyObject]] else {
            return
        }
        entries = entryDictionary.flatMap({Entry(dictionary: $0)})
    }

}


/*
 var playlists = [Playlist]()
 
 func addPlaylist(name: String) {
 let playlist = Playlist(name: name, song: [])
 playlists.append(playlist)
 }
 
 
 func deletePlaylist(playlist: Playlist){
 guard let indexOfPlaylist = playlists.indexOf(playlist) else {
 return
 }
 playlists.removeAtIndex(indexOfPlaylist)
 }
 
 
 func addSongToPlaylist(song: Song, playlist: Playlist) {
 playlist.song.append(song)
 }
 
 
 func removeSongFromPlaylist(song: Song, playlist: Playlist) {
 guard let indexOfSong = playlist.song.indexOf(song) else {
 return
 }
 playlist.song.removeAtIndex(indexOfSong)
 }
 }


//Shared instance
*/








