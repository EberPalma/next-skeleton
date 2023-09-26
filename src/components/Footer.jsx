'use client'
import { useSession, signIn, signOut } from "next-auth/react";

export default function Footer() {
    const { data: session } = useSession();
    if (session) {
        return <div className="d-flex justify-content-center">
            <span>Signed in as: {session.user.name}</span><br />
            <button className="" onClick={() => { signOut() }}>Sign out</button>
        </ div>
    } else {
        return <div className="d-flex">
            <span>You are not signed in</span><br />
            <button onClick={() => { signIn() }}>Sign in</button>
        </div >
    }
}